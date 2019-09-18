Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED62ED075C
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 08:42:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p4Py173vzDqLN
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2019 17:41:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=web.de
 (client-ip=212.227.15.14; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="p5Dewd3F"; 
 dkim-atps=neutral
X-Greylist: delayed 343 seconds by postgrey-1.36 at bilbo;
 Wed, 18 Sep 2019 18:26:51 AEST
Received: from mout.web.de (mout.web.de [212.227.15.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YCkg5VMCzF4Y5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Sep 2019 18:26:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1568795197;
 bh=kl3+5d55kYmOUszrkbFC3X73LvbxfWH1DxtIwtNLNjU=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=p5Dewd3F/DUASxmnKR7Y03X09nBXfkoEpgqcEhjENsYx4W4kFWwR6ksxV+GnKtGYP
 CITX3i6+PCCf6LNWr1ULx+usnvaqouKpTG6ea6j6b4kphBDlenozt3XUTifXVR1dem
 1SHqu3DJsiSC0MVwENKzmhy36iEkdCwa2I2N7NSM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.2.101]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MI6F4-1iELkB3BGQ-003rsn; Wed, 18
 Sep 2019 10:20:13 +0200
To: linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, Joel Stanley <joel@jms.id.au>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] hwmon: (aspeed-pwm-tacho) Use
 devm_platform_ioremap_resource() in aspeed_pwm_tacho_probe()
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
Message-ID: <cd5bab7b-9333-2a43-bcf0-a47bbbe719eb@web.de>
Date: Wed, 18 Sep 2019 10:20:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YMH6mg5kaUBoVv5GIonZBw2R5Sy5Htur1qU8tdIJrLkDBp0mvJq
 vQbHswXf8bSTtwFt+rNDn6rqLKFm2hgwvSwQVKPLFBhFKc9HWUv7QDVrGinL5bpRulYoczJ
 90Vs1FYYA9TDXaS84R5WRJlCtBV+Kgdups8L6ARUR9VJEb1c447SEjPNI+o2wpa3oKWWrXW
 qgbksN600FHMU5mp/e2Zw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ok1MvXDFJsQ=:LFC4xPkjw26tOTOWcna97G
 Vx4FQWgyWWjy6NkyntnmpYRWAhfT3pwHZUzvM0burS77fy8nONmxqLkLIqJYCGqGI1OuRdwB3
 jwcAZm/g+/JVxsQAsAfLpQrD+wy0nvVAvDIckbQqyV+g/9PCZV4iC3Bw9jlIJcy4LLj6Lm9td
 BIgb0SRdWdsnHRkq34jmkcdR1F3lGIymQxB6bB+efCj3HHtFI6vnXJOHEWDOo2s04LenbWE6S
 12Fj/PrWibob9qRyC9VRA8b7tbgW5ODdLKsmQe1+epcLPJDMBDBYRvq+a0yUpxkXvGRyCeUoB
 8wowag6HILe3PUiR29hwbR6uVaMjjglmDxEbiIdPsApcWYGvn9htdZlCBT8mabRRb7DckR58o
 /+lzgXJH2yf7ylcQJTkHi1mMna7Atk+iEA8C2Qntv1V3zLb4TRYUTTl5p49+FdIggo3fF3voc
 dkhw+6YyU+hk3A+07IbJmS+WAREUw/+OcLcx2JUnpHga+rutwhq4IK9eqHDNxLvD6wMzPf/Gh
 OvdYGSQ8Y23P84EERAHs8ygc1scK3cBCZggMvYS3I+wW//Uagx31EhZSFsnO2VRlqv4FoaZfo
 J6llCrDQpNoz7TJNmGTAJ1xDFp34Fb6REEWF5POhBRRShpmMWqFBQF7EIGQvJy4CMcEoVgytd
 Yf3O2AzkHW/GPmyhohtfOUfEm0sOGz94bL95PzHHJOPvr0Top7lPbxHAUPeHJkOlih6mQktlH
 cbmdl1QJ8ifgqtqdN7CHT8C23SMWzrtNVI7nfUM+ZDtbWL+nqP/D0DWkyPA+tj7NTfJoAcr9G
 3/2sjINtrZ3FSbatGpsbM2iehNGTDmgUpdXCc7JIhDPCbgdashzZ9ywNzGO633gez1NwiV+u+
 66lWbPAsln+cAOgYseChoVFQJOi+KlPp5FyoLo/5u2cxgycfp8x8I0dpjjUzRXlvIuWDtODkg
 alO5ETGG/Utp9phsO6hDt5lWJObkDW8SnCLNnJYNCBwKzWue3lGVmW3NzLmRvK+eRTi3zdb/c
 1U+Gdz3TLLTCee7ZKzSaIDiVPrv9YhLUJLc1W+dgi6bIbRkgzawJWfaF/OIfr2PjLjNR2aEz0
 U8r0u6lsEPAqtZBOQdGJJVTlAnp05sy/0ogEG+jW3m+9ecop52C8T7xuPbOp+/OkOEo7LA8qr
 TTeBscYnrTBf7SgF7gsHZLjKIP5f+/vznIUOMGeHlTAlwd98uzIajvh3ra+0LZeMcSTLoRuMk
 kZwK36ueqWNKWyedtRzL/kvgglmhmCYAXNUipsIUb9SbwMzXP07wSk6ctRDAuoGjHs3Fp3hxU
 UiAC754YOpP0uNgwy53l8UigTe3MhT81lNiV5/y3rx+qBJ9gFKvfoEOfTWoSt1IdbkzWwC2Z+
 fjFBBO+3GFb4KMXjbdySUuINCJk6Uq3yqw0Q17yOMvd82ZT0rGZsUqAh6B21P2hOOxm20LIHq
 Zn2tVwDnH8f1tsiXIdW43XLcD5kmv3OjARtTyQV559ODJBL2aJ3feOzPYDjzlhCUWwjc9aQNf
 OHCNntfg2WyqVF3rn0WJ0wIo=
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Himanshu Jha <himanshujha199640@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 10:12:31 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/hwmon/aspeed-pwm-tacho.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-t=
acho.c
index 40c489be62ea..33fb54845bf6 100644
=2D-- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -891,17 +891,12 @@ static int aspeed_pwm_tacho_probe(struct platform_de=
vice *pdev)
 	struct device_node *np, *child;
 	struct aspeed_pwm_tacho_data *priv;
 	void __iomem *regs;
-	struct resource *res;
 	struct device *hwmon;
 	struct clk *clk;
 	int ret;

 	np =3D dev->of_node;
-
-	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENOENT;
-	regs =3D devm_ioremap_resource(dev, res);
+	regs =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
=2D-
2.23.0

