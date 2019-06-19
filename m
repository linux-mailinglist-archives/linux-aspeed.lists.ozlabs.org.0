Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E174B945
	for <lists+linux-aspeed@lfdr.de>; Wed, 19 Jun 2019 15:02:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TQ8y6DwCzDqMX
	for <lists+linux-aspeed@lfdr.de>; Wed, 19 Jun 2019 23:02:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 330 seconds by postgrey-1.36 at bilbo;
 Wed, 19 Jun 2019 23:02:34 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TQ8p355kzDqGQ
 for <linux-aspeed@lists.ozlabs.org>; Wed, 19 Jun 2019 23:02:33 +1000 (AEST)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Md6dH-1iCdyW161r-00aBCA; Wed, 19 Jun 2019 14:56:39 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH] soc: aspeed: fix probe error handling
Date: Wed, 19 Jun 2019 14:56:23 +0200
Message-Id: <20190619125636.1109665-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZJwSOzQMuPpHsrU/+qvC0BE/4HBT6tcQ0i6nWWwdFMZI7Lp37LT
 EhDuHwiX9TgKYWtK3bytwlf9alSchNSd3HIu3+i2ShJqPpZF0IycKFhDZRLr5nSzcurUU8s
 TTlggu2/kKjAzmi0JMsgLMKJmUrck9PseSduRgPAZEBfkRhQNKngF+cstswdqnsCwYfUOtC
 DYfjeGhgOkWZQRKdeV1CA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JIFqcC1Zamc=:jIvFssEuUIxwq79znKYfek
 OHEYYZRIoIPpL8R/ja9A8DHS0mQLgkLLIII5mwtSuH9/Knc7H7Ql7QJ3euomfwKQUtQuIVB/F
 YeU6EOjErZyzBxS9OQiR7CK5yKDH3kytPzEfnbxzusFAcBnln9FSxKyZ8p0oSGeICFWaD3SC/
 whtyE1yHrl5dtfdn3HbJEoKQy360Rmbgn9FuHzjHkrNnPV714vdRjmSvzJ7rV7DIU0OYaqJ6g
 ZzZQAz0dAQPtmofqSNv2/BHRawhc/lms/uHjySPMqArCwXc08jC6+OBC5VoWvqXRo79qXPbv/
 wfnZJ2iRAfIMXN8HegcXi6Z46d5ooXM4adB6l0ubVMa/+6BNYQe1ggCx4rX9q+iAK1TKPfVBN
 Bw8DPa+f4kCTF/feHBqbUSXAc+6s+2Z9cExpNsF8zLn9aHqOjXQG7sPPUmNLN9cJbxJntiApF
 SkUAD9avpXbmtMoXIe6jgvI2FyIWzXj8W7CyWK6cd/5ocbYorN1LIZZdiir2sy+dm8a+C926/
 tPD/0VC9lnnpGszu631GVmeD/ELmKO8W1+x8rglBQ0aEivf97q9/XTP4eprrObHJPAwRrR1PW
 jVRbfFkrvz42lZDOtymbKNG+F+FoLYgj1ySjzaEAEZUv0ddnN1/NHzm4awUjDbdNlFOqFW5k9
 q9Qiw1ztm4sk2iS8W88yDPYYIzDBlDP6CItCX4/j8mIBF8vqLizHY8+hvQJmiBMGo5ix0nfB1
 FJ7ob4bpprgCOunVd9PJUmLXRi/Uwn43geDt6Q==
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org,
 Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

gcc warns that a mising "flash" phandle node leads to undefined
behavior later:

drivers/soc/aspeed/aspeed-lpc-ctrl.c: In function 'aspeed_lpc_ctrl_probe':
drivers/soc/aspeed/aspeed-lpc-ctrl.c:201:18: error: '*((void *)&resm+8)' may be used uninitialized in this function [-Werror=maybe-uninitialized]

The device cannot work without this node, so just error out here.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
index 239520bb207e..81109d22af6a 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -212,6 +212,7 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 	node = of_parse_phandle(dev->of_node, "flash", 0);
 	if (!node) {
 		dev_dbg(dev, "Didn't find host pnor flash node\n");
+		return -ENXIO;
 	} else {
 		rc = of_address_to_resource(node, 1, &resm);
 		of_node_put(node);
-- 
2.20.0

