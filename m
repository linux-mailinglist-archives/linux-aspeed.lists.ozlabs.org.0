Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3486898B059
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:46:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkn31PKz3gHj
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::734"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697928;
	cv=none; b=VzyAg63rFbCxe3rw3lCbBS4csI5UExcht317jKELUB7PKNhYBWygHcxLQeX2uMZnjCspDbQXkS0zoaSdCBk5j6WE8UDwjmsylpZJuHn831DBOVZHy+rogZi6TuqJylrZ+5cHuGMqch/r50hQGpLP+JeuHpOXF2kAOswL4lLgsjX2ggEhXRA3XeilsaFvxbO/+M7mHClgPVVVSqD9HcCOHuxPu7eBcTYLQSh/jII6wHo2MnE+e45QUBUYlwyWAdfm9urJdl1N5DRg23Yuz9r6VGpIlf1SfcxqRsiERiBk1J745BSlE1XNaqGqsBARX17Dr7xDeZrlDIhDbyuEvl1XYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697928; c=relaxed/relaxed;
	bh=azNmlM3B7hyMNMP40kUqke3tzTp1ln1Edxwu7YerKBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F9Ns6Koe+YgB/XlnF3254khneLqPV17YUeYendN4rkiAxbs88pFGVv6uAcNb0ChJtP6rzqfEykUzJvrF9QpG+6kYiVuusYxUbqZ1yy1riSd30pgGu5TMqOOKeyiBP6kvk3Uoy/bx9vkPUDe4LXvg6o4y3hrGjnl1nZZsKZwrHF4HPYl3N1gpKKm/7ICpq4ZfY6g0a16sUXj910YhziQhv4lySnsIVgcSq7FR+qs12aMZkoe8+8AEBcpF6BFk33NsOZJNQU+of7qHKU78fdUPMVc947hd4W4M7Iup9uHrRD/d1AI6hDzXcQhGfRUc7y0VfJm+bCLsjfLDL8oW7fFqtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fP2ZBzFU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fP2ZBzFU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKX82JWLz2ytV
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:28 +1000 (AEST)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7a9b049251eso341542785a.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697925; x=1728302725; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azNmlM3B7hyMNMP40kUqke3tzTp1ln1Edxwu7YerKBg=;
        b=fP2ZBzFUZxdR/MNktXEa1z2Z3NxX8bbUxPKH6GoAbEMymKw1mj0ZeT0Q7hxFqIsc9Y
         HCRjtmqH9QJtGwRLqQVkZtN8RpkEbvaonC6cE9WXfP/vJ+PJS81BtFkVwFJaJK+7vK6L
         xOtexJHumGt/myXmlE/antZGRVtSI/ysdxr5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697925; x=1728302725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azNmlM3B7hyMNMP40kUqke3tzTp1ln1Edxwu7YerKBg=;
        b=Wjy6du9MVM3Vvv4IbgQWjnHV8qoFqES11EpWjFMNvKxkDZh6m5u3ljHoYkp565vE8J
         dryDL1a0MOjBC9X9WMlpuA+Iszk+VQsqjtSQI8lUvzptjj8xSMSrM95l44bgE3hBgG8l
         vfX3thOz/iE4vO4s3O5vRTpqQZc2Qny7ugKWZU7qBqCn+nUX+Si6ip7epLyUUx9FiWm0
         uUsZUHQL11nMQQS1blYMZvdCSgFWRoD00bQQ477vG3Q2KHT74PequQPXkuVhTFnDAzQN
         oYmnLXaS4B0CfxWXYCchGWUTc+787c4uwoYKkmiruJw3p3jdRAqkz54D4BpQUPfBoD3t
         3i9A==
X-Forwarded-Encrypted: i=1; AJvYcCUwxtNK076n6OqNL3VKcfIF5lCFtaqKRk2M4Gv8Zb095G/+Md07lELxgV3zG+8YC4c9AUmLtpdrJbVRoMc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzChok+6wAQD+DZe/DOTUXrXL5NDTz9crhefcPNpJ8T7EXoAnUk
	sL/o4SZEraCixN+CGW4H1dzUi0cmN2vfkjX3M2zUucWM1l15LAUD5+JnqSWdlg==
X-Google-Smtp-Source: AGHT+IH+OoBvU1VpQTPHiaktqSzIksNgZvG/jG37uysXmmuE+j75SqTMgbPUwFz7aDU3AoUz/9R6MA==
X-Received: by 2002:a05:6214:450a:b0:6c5:60a1:d99d with SMTP id 6a1803df08f44-6cb3b64c714mr169599236d6.47.1727697925305;
        Mon, 30 Sep 2024 05:05:25 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:37 +0000
Subject: [PATCH 42/45] media: i2c: saa7110: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-42-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.13.0
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 01 Oct 2024 08:45:20 +1000
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
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The following cocci warning is fixed
drivers/media/i2c/saa7110.c:313:37-43: opportunity for str_on_off(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/saa7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/saa7110.c b/drivers/media/i2c/saa7110.c
index 942aeeb40c52..15134ac706d7 100644
--- a/drivers/media/i2c/saa7110.c
+++ b/drivers/media/i2c/saa7110.c
@@ -310,7 +310,7 @@ static int saa7110_s_stream(struct v4l2_subdev *sd, int enable)
 	if (decoder->enable != enable) {
 		decoder->enable = enable;
 		saa7110_write(sd, 0x0E, enable ? 0x18 : 0x80);
-		v4l2_dbg(1, debug, sd, "YUV %s\n", enable ? "on" : "off");
+		v4l2_dbg(1, debug, sd, "YUV %s\n", str_on_off(enable));
 	}
 	return 0;
 }

-- 
2.46.1.824.gd892dcdcdd-goog

