Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C67EB707
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Nov 2023 20:53:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xu1CUwPs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVH6D2NgGz3cc6
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Nov 2023 06:53:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xu1CUwPs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gustavoars@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVH635Dbcz2xpp
	for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Nov 2023 06:53:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9DBC161369;
	Tue, 14 Nov 2023 19:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473DBC433C8;
	Tue, 14 Nov 2023 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699991592;
	bh=p5bXNYWZQPXVZtSAziETIAWqwitA5MwvAafu84FIsRc=;
	h=Date:From:To:Cc:Subject:From;
	b=Xu1CUwPsb8NHywQsuf0ZjveiUXv6X56buMrIIKqhntvic2H0v69ZAGSIpnJd4JGXq
	 x62nDwx5EpPDgApZdmHcRyahh3cgVMVMcqSQuN0tHGMd5q9TjcJIwdd/AJWnvOybct
	 BxyPFjHQ59HKLzh3aSNwATPGQCZXSmpoR6nVlFQUmAr7+xOGmRx3sX2RfXekyk5/gt
	 +j28UfzElp+1DtYEdQl6NrFRsLL/3A9eJGxe64yy2d+x6FMpIrgIhI3mVMPK7Dt7jN
	 wbXRG4wrJ9T76vOS1vvmbqI5iODtF/BUyde4KI/XcWhpaW/SpEkp2mTjDlnDjaMqCo
	 VYw7dCdZvPMYQ==
Date: Tue, 14 Nov 2023 13:53:08 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2][next] hwmon: (aspeed-pwm-tacho) Fix -Wstringop-overflow
 warning in aspeed_create_fan_tach_channel()
Message-ID: <ZVPQJIP26dIzRAr6@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: linux-hwmon@vger.kernel.org, linux-aspeed@lists.ozlabs.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Based on the documentation below, the maximum number of Fan tach
channels is 16:

Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt:45:
 45 - aspeed,fan-tach-ch : should specify the Fan tach input channel.
 46                 integer value in the range 0 through 15, with 0 indicating
 47                 Fan tach channel 0 and 15 indicating Fan tach channel 15.
 48                 At least one Fan tach input channel is required.

However, the compiler doesn't know that, and legitimaly warns about a potential
overwrite in array `u8 fan_tach_ch_source[16]` in `struct aspeed_pwm_tacho_data`,
in case `index` takes a value outside the boundaries of the array:

drivers/hwmon/aspeed-pwm-tacho.c:
179 struct aspeed_pwm_tacho_data {
...
184         bool fan_tach_present[16];
...
193         u8 fan_tach_ch_source[16];
196 };

In function ‘aspeed_create_fan_tach_channel’,
    inlined from ‘aspeed_create_fan’ at drivers/hwmon/aspeed-pwm-tacho.c:877:2,
    inlined from ‘aspeed_pwm_tacho_probe’ at drivers/hwmon/aspeed-pwm-tacho.c:936:9:
drivers/hwmon/aspeed-pwm-tacho.c:751:49: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
  751 |                 priv->fan_tach_ch_source[index] = pwm_source;
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
drivers/hwmon/aspeed-pwm-tacho.c: In function ‘aspeed_pwm_tacho_probe’:
drivers/hwmon/aspeed-pwm-tacho.c:193:12: note: at offset [48, 255] into destination object ‘fan_tach_ch_source’ of size 16
  193 |         u8 fan_tach_ch_source[16];
      |            ^~~~~~~~~~~~~~~~~~

Fix this by sanity checking `index` before using it to index arrays of
size 16 elements in `struct aspeed_pwm_tacho_data`. Also, pass `dev` as
argument to function `aspeed_create_fan_tach_channel()`, and add an error
message in case `index` is out-of-bounds, in which case return `-EINVAL`.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Pass `dev` to function aspeed_create_fan_tach_channel() and return
   -EINVAL in case of error. (Guenter)
 - Update changelog text.

v1:
 - Link: https://lore.kernel.org/linux-hardening/ZVJ7JBFoULzY3VGx@work/

 drivers/hwmon/aspeed-pwm-tacho.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 997df4b40509..9a209e064e46 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -166,6 +166,8 @@
 
 #define MAX_CDEV_NAME_LEN 16
 
+#define MAX_ASPEED_FAN_TACH_CHANNELS 16
+
 struct aspeed_cooling_device {
 	char name[16];
 	struct aspeed_pwm_tacho_data *priv;
@@ -181,7 +183,7 @@ struct aspeed_pwm_tacho_data {
 	struct reset_control *rst;
 	unsigned long clk_freq;
 	bool pwm_present[8];
-	bool fan_tach_present[16];
+	bool fan_tach_present[MAX_ASPEED_FAN_TACH_CHANNELS];
 	u8 type_pwm_clock_unit[3];
 	u8 type_pwm_clock_division_h[3];
 	u8 type_pwm_clock_division_l[3];
@@ -190,7 +192,7 @@ struct aspeed_pwm_tacho_data {
 	u16 type_fan_tach_unit[3];
 	u8 pwm_port_type[8];
 	u8 pwm_port_fan_ctrl[8];
-	u8 fan_tach_ch_source[16];
+	u8 fan_tach_ch_source[MAX_ASPEED_FAN_TACH_CHANNELS];
 	struct aspeed_cooling_device *cdev[8];
 	const struct attribute_group *groups[3];
 };
@@ -737,7 +739,8 @@ static void aspeed_create_pwm_port(struct aspeed_pwm_tacho_data *priv,
 	aspeed_set_pwm_port_fan_ctrl(priv, pwm_port, INIT_FAN_CTRL);
 }
 
-static void aspeed_create_fan_tach_channel(struct aspeed_pwm_tacho_data *priv,
+static int aspeed_create_fan_tach_channel(struct device *dev,
+					   struct aspeed_pwm_tacho_data *priv,
 					   u8 *fan_tach_ch,
 					   int count,
 					   u8 pwm_source)
@@ -746,11 +749,17 @@ static void aspeed_create_fan_tach_channel(struct aspeed_pwm_tacho_data *priv,
 
 	for (val = 0; val < count; val++) {
 		index = fan_tach_ch[val];
+		if (index >= MAX_ASPEED_FAN_TACH_CHANNELS) {
+			dev_err(dev, "Invalid Fan Tach input channel %u\n.", index);
+			return -EINVAL;
+		}
 		aspeed_set_fan_tach_ch_enable(priv->regmap, index, true);
 		priv->fan_tach_present[index] = true;
 		priv->fan_tach_ch_source[index] = pwm_source;
 		aspeed_set_fan_tach_ch_source(priv->regmap, index, pwm_source);
 	}
+
+	return 0;
 }
 
 static int
@@ -874,7 +883,10 @@ static int aspeed_create_fan(struct device *dev,
 					fan_tach_ch, count);
 	if (ret)
 		return ret;
-	aspeed_create_fan_tach_channel(priv, fan_tach_ch, count, pwm_port);
+
+	ret = aspeed_create_fan_tach_channel(dev, priv, fan_tach_ch, count, pwm_port);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.34.1

