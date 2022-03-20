const fs = require('fs');
// 챕터의 content 가져오기
router.get('/content/', async (req, res, next) => {
    // 임시로 유저아이디는 req.body에서 가져옴.
    const userId = req.body.userId;
    try {
        const writtenNovels = await Novel.findAll({
            attributes: ['novelTitle', 'novelDescription', 'novelGenre', 'novelID'],
            where : {
                User_userID : userId,
            }
        });

        res.send({
            "novels" : writtenNovels
        });
       
    } catch(err) {
        console.log(err);
    }
});