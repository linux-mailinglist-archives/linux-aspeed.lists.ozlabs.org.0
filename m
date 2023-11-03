Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 774197E778A
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Nov 2023 03:31:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=OEQkV68v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRNB92lkHz3cTp
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Nov 2023 13:31:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=OEQkV68v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=alexander.hansen@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SMH9P0CTWz30fk
	for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Nov 2023 21:31:50 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32f70391608so882908f8f.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 03 Nov 2023 03:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1699007503; x=1699612303; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KB8BFBrWt5cdMdMUbKVX9KzIODIdRsQC4ffz0FV6Nlo=;
        b=OEQkV68v9WNzWWS9Hg0f/d//O62upI5gpkT96O4APAxL5l2hFlbAG42usbFk4jC+T2
         wQYT1xADJP8rmSj0ZfsZQ9W3JIzBX0N+pjz0vM/yK44k/tEtxf2+GLfiAEf13NnIXv3r
         YwJy8Z5bh4xcPMyoX07ntkQOCruGjWlT5xOlMQ3CMv4LqJ9R6yzyYfGNeUfTcRBYHpmq
         6dwDzIuiCwGQ5nR4bbNXStouCiQL4yT4/MflF4gToN0Fjj+YoLEBoItEZI2J0cmmzzfL
         I0QDr/weDm2bUle06zxo6lN0DSv7CUUXmavCjYbquQ86U/IUgNQeHBVuF6RKEik8+Tq/
         Ol8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699007503; x=1699612303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KB8BFBrWt5cdMdMUbKVX9KzIODIdRsQC4ffz0FV6Nlo=;
        b=j9BIa5OwDJkUooUzKo8mT/pzwt1qTSyl8agL7aqp0LHq1KtwpNip04JgYblRkieLxQ
         yDpmI1c8eKFXOcrmpW4prAKbamTWeOSEUjuoT6QfM3CW3DXvFSdKcbu7GTvQSqOFQgSz
         GyuZ1pEPizZGJt959Ljkd+HTr5QOH3nVbfXfgTB9Z/jXnH0lxozGdEGkBtmuFKTjRHSv
         WXswXzO6eHGX0FCgwqLBedaaaSpt2w9lvHKKwInE5ET0YGLhA0A4qDg0fruJXfsqkPFG
         ASVwQ3vM1z5vr63QYNPn7kcP0qlHZOmeTxziuRIOcUMrfLkW7LLn2YNiqOi4MfszehXm
         4XYw==
X-Gm-Message-State: AOJu0YzvXfcxOiEoqx5yoyD4H09rBeVCQBTW/F25NKA7Dko/R3kmXeQv
	QjmDJn5I5uwXkbXrJtuxhO6DYA==
X-Google-Smtp-Source: AGHT+IEIlB2E3hb2daCNNGhpAtJIEYOq+xWyQtc40nSeuD54pfR8jsdJ3zTJksQ7asKTBUpW7gelFQ==
X-Received: by 2002:adf:f390:0:b0:32d:a98c:aa1f with SMTP id m16-20020adff390000000b0032da98caa1fmr15069898wro.1.1699007503174;
        Fri, 03 Nov 2023 03:31:43 -0700 (PDT)
Received: from zbox.lab.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id h17-20020adff4d1000000b0031c52e81490sm1511297wrp.72.2023.11.03.03.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 03:31:42 -0700 (PDT)
From: Alexander Hansen <alexander.hansen@9elements.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v1 1/1] hwmon: (aspeed-pwm-tacho) mutex for tach reading
Date: Fri,  3 Nov 2023 11:30:55 +0100
Message-ID: <121d888762a1232ef403cf35230ccf7b3887083a.1699007401.git.alexander.hansen@9elements.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 10 Nov 2023 13:24:54 +1100
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
Cc: linux-hwmon@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Loic Prylli <lprylli@netflix.com>, Alexander Hansen <alexander.hansen@9elements.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Loic Prylli <lprylli@netflix.com>

the ASPEED_PTCR_RESULT Register can only hold the result for a
single fan input. Adding a mutex to protect the register until the
reading is done.

Signed-off-by: Loic Prylli <lprylli@netflix.com>
Signed-off-by: Alexander Hansen <alexander.hansen@9elements.com>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 997df4b40509..b2ae2176f11f 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -193,6 +193,8 @@ struct aspeed_pwm_tacho_data {
 	u8 fan_tach_ch_source[16];
 	struct aspeed_cooling_device *cdev[8];
 	const struct attribute_group *groups[3];
+	/* protects access to shared ASPEED_PTCR_RESULT */
+	struct mutex tach_lock;
 };
 
 enum type { TYPEM, TYPEN, TYPEO };
@@ -527,6 +529,8 @@ static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
 	u8 fan_tach_ch_source, type, mode, both;
 	int ret;
 
+	mutex_lock(&priv->tach_lock);
+
 	regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0);
 	regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0x1 << fan_tach_ch);
 
@@ -544,6 +548,8 @@ static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
 		ASPEED_RPM_STATUS_SLEEP_USEC,
 		usec);
 
+	mutex_unlock(&priv->tach_lock);
+
 	/* return -ETIMEDOUT if we didn't get an answer. */
 	if (ret)
 		return ret;
@@ -903,6 +909,7 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
+	mutex_init(&priv->tach_lock);
 	priv->regmap = devm_regmap_init(dev, NULL, (__force void *)regs,
 			&aspeed_pwm_tacho_regmap_config);
 	if (IS_ERR(priv->regmap))
-- 
2.42.0

