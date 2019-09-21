Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE3AD0761
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 08:42:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p4QS6v3GzDqLJ
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 17:42:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=web.de
 (client-ip=212.227.17.11; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="WFZKveuI"; 
 dkim-atps=neutral
X-Greylist: delayed 332 seconds by postgrey-1.36 at bilbo;
 Sun, 22 Sep 2019 02:53:04 AEST
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46bGqN1JVlzDqR3
 for <linux-aspeed@lists.ozlabs.org>; Sun, 22 Sep 2019 02:53:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1569084779;
 bh=VUVk13mdIUuMlRF55b+yf9VzEN/rt7FIag9gQ7yHvvQ=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=WFZKveuIS7PgMrfbtgIpWlMEiVSUqSKppDc5g5uQxgY1w1D6rCyJpXBOdxCDMmzNx
 lq/m0F66JABIeHNgHBTqXQthFpbuIJN+hbz+HSqVL64muSR76KJMct/waoWZ9l/XOf
 LA3QGykg6gIAoCPiljn8smrEfbiSabRpAvF4Zgjo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.64.44]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MHowb-1iD6Vg1oQ1-003hfK; Sat, 21
 Sep 2019 18:46:41 +0200
To: linux-edac@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>,
 Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>,
 Joel Stanley <joel@jms.id.au>, Robert Richter <rrichter@marvell.com>,
 Stefan Schaeckeler <sschaeck@cisco.com>, Tony Luck <tony.luck@intel.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] EDAC: Aspeed: Use devm_platform_ioremap_resource() in
 aspeed_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <baabb9e9-a1b2-3a04-9fb6-aa632de5f722@web.de>
Date: Sat, 21 Sep 2019 18:46:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gq8XlCdUOHM8oIbnPHW7UAQIq6Z5GsKadnkCt5VEwli0lbxdNOF
 LIEuJRSDw9nn014aM1FIr+hnU/EJ1QAKjxQpIjtmKrvezGfZiXoDqhy8MsYX4y8gMXPbpr7
 2iseSo6skajlINOGRWd9slaRrg5HfQBKDa5IJB+MoWn/YKa9V8/3ERs8WoDFMQIPx4aYGFY
 jt/c+YYhfT34FpG8ceg0g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qzgvH4ckgOQ=:vyjX/QndXJ+2Ohb/M9AV/T
 GthGYz/UgLoFNVfqsCtarCAVvTmljKQShyLELi61EuMd8Mrjpyhqx+N5MMM3LPU9ZT7o8i9/g
 +YWXfNFRI2sX57fXIk/WUEnXVJdPA4ZBiofs69VyjwXEp2gA2M51627/Li/Rb1YdDLkj9FTvq
 GsgnqQ/QxFAQ1IO3SCO+zab4wexv+yi9ovZyHZJEug6G5ERAp6EoKsb3HXT4RP1plmnaLaHmJ
 5TNKDwpowePHu+D1kefMoiRLcwOVuZnnMHayxgkvFEleYIX9LL2eY13A5MU7nifmD4Ag5JQ8j
 Iv4sf/8JPUHh/wx89WmW1ff6Ecn3LhdwAYKcX5X4mm3wBNQMqWtMD02i7KVMllX1uScuTT+8M
 Z3kGQIaNSjCJ5Gg8oembR/5sHMZZh0J+eT8/9QGGuOIXumJRzDFeiLMgmUwXXw1+OQVENnAmD
 oMAYGb8rxJv8qiKInZMRxb9n2sPeJlLd45J2YYisEuiSPFVl4siir0suwAur3WOh3zgRuFSR+
 Z6CRTX0Y8KDx2r4LotnKHxU1Auuf+P/K3xZJVXyYbjitMvO8g4/KBHnPm9wujN0Gfo/MhlJqV
 7f4057stw9PJzJ3HQOOC8gywv2tKKOr+VfU2UDAnilDUXqUl6e9AewKyg23tdupZ38H6gJx5u
 DWZv3oWAGJNNGlZxYcId41M1mNNn4TN1GtEvNUk8izsTY/srrXLe5p7w7TzavQn7T60Vo1Hnm
 S4m7VzTR2x/OqfpuSz4S30rQ2bTlRYBT8Z2j9SdWsYhVcpmnM6usDnf3m6xRTbnRvwgYkuinp
 CXPM6IdiapCeQBmjwp+YJhhfGTeoHnxwQI0Qcy4mMnvnMysJgqPZvhETOeq2D6StPiOlDoRss
 kOK6RGswWxLu6sV6O5E98G9nQ3/y8uMYt0nwyryDwJkth3b585sHL4Wdi6Cz2MJTpzOFSh0Iw
 2yKuZYyD1/q2K2vIDYtv7FC3ZPn5327Y/KWNoYTE0L6JZufxfDheOEOvw5KMLFBjjokKoO7Vf
 XiOZaSMuJ66xO/iKHxNL09afEjtzzjt9WCd/ZEPrWPD6ed7of1lUQps2F8BNr9vZIx6n9U36u
 eUSTrlubMF13YuDpDEzQeJBCJTAuilPqsCnPFmFyhd1mnrhj6zpuJXasUrBtegmsNtMD+fTWv
 RxSFfvsz9qIuDysalCxT3va4Nx68iJ2hyIOYPGufnmvWJKoaIIHlwBIlRrE/mVDZtYaDpNKM/
 9nIsdFX6Z2ykG/wmYXgDW1E82OzYHcI9VtB0fnUBQc2e5ppzztQ3UbUvr6ys=
X-Mailman-Approved-At: Wed, 09 Oct 2019 17:41:40 +1100
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 18:32:46 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/edac/aspeed_edac.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index 5634437bb39d..09a9e3de9595 100644
=2D-- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -281,16 +281,11 @@ static int aspeed_probe(struct platform_device *pdev=
)
 	struct device *dev =3D &pdev->dev;
 	struct edac_mc_layer layers[2];
 	struct mem_ctl_info *mci;
-	struct resource *res;
 	void __iomem *regs;
 	u32 reg04;
 	int rc;

-	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENOENT;
-
-	regs =3D devm_ioremap_resource(dev, res);
+	regs =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);

=2D-
2.23.0

