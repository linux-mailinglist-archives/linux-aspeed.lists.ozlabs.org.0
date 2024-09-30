Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A63898B05A
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:46:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkm1llsz3gDg
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697920;
	cv=none; b=JqnuyPjsH5R7qZKoGSslYaj08XIt09w5b926Bur2g+kyybCS2QBiBWpuYTLu05KBWTx2HVYVa58RVzebMawek+TNG/V98/VVaSwPh6lRz4J3Z5/c7Erb7mPrUYI9ycjEn+AADuFW+aQ0R/dLKO2J5laGny8zjrkRBULgxbSqXfn96qsoJdAph858N0SoGlnHOGbI4WKTNuOmtxMBL94qkgA2ZLBieHTGfFTrfloDkFA6naZaR1ITFRqtQqiYO8o5q3hvSmNx0CbZR0k5Psdzz4hnotgb1jr2aPKO38aB+PPh2qgAktDHXIn7XzOTc6kRCzIcqsJ8u3PiswS45gDmGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697920; c=relaxed/relaxed;
	bh=HJx29BD9yZboyGEAUyw+4rBBbXZtXq331Q8okj0vBtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTlstb4SH/Y4Aos8CUWyAC5/+N0BRqOdJXVkeyMun8p5hUmIO/aq4Ns4GSiZe9qKLUUj0zP8uQHwEYM60SXO0QfRMY6mKohwCU9zaSaSEgJlWdNxjMsPR6HAdDnVlPj+i0Dt4yrTXqLE8OdtRToCj8G+bobGWfEQ07Xo/LKAyLx+pBlrrcnFcR8qI17b0Nbgmz1auuyyWMjNjVZRr9zSf8TcU674qljBze1a6cH0LwkKc5dmhlmIn2k+DpE++kfyc/9jWk+SIzX5gi3GOElAGwjz/GSuvp1Qi+Lhvz64vaVfgNQl73WjifK5uLJwNyMW84IwZs57Pth+13n5RKVUHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UthlpGgU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2d; helo=mail-qv1-xf2d.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UthlpGgU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f2d; helo=mail-qv1-xf2d.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKX01xQhz2yps
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:20 +1000 (AEST)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6cb4c013b78so18085296d6.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697918; x=1728302718; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJx29BD9yZboyGEAUyw+4rBBbXZtXq331Q8okj0vBtk=;
        b=UthlpGgUh/71AtJX5mwT4tvnJDdQ19wrZpJ6BHKrpZndVDER/ti5gFGswdmuUKrE0Z
         SuZ3Iv6i5G84rhCGLnBOJ7hpi22Xf0+5li+GySam6zjEQQ5K3lYpO/SIfA6j9C7i3Tio
         Eqa1o5BxCs4ImDVqafo5/cQexVlruKcQU+2VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697918; x=1728302718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJx29BD9yZboyGEAUyw+4rBBbXZtXq331Q8okj0vBtk=;
        b=ABrE0I7JPntwo7sUwTilwIjhhoQ67Z5t6HSKkdKW4qqLoaIvmg9CzKn4XqornzkZaU
         Q8rdijPOnHN7PBGUjL7tkZ/La7YgwL96ipZ2r/ojmuVWrWAjLtNRUAB6IeRloBg0KJYg
         ew7DNLF96++c5A2OSYn0BmeszoTNaf2KAo3IiOC25esB8AEh1P0JLeJRrIgCTlXQCzF2
         8bSpcKZdQ5bYfvlbwZP2V+7z6nqeLAPixpmuRn1Hs1smCd2Y2hoH6KrmokjDP2/89Yns
         t1s/TcJQqiuL3PWFwGMgbOqAq0r6KUtoZa5I5WwXugK48lxXzf7CxZ/F4pb2nVP/SKIA
         Sntw==
X-Forwarded-Encrypted: i=1; AJvYcCVk2xpyuQIfHEH5ETFf3uI3wTH2VRpTDZW/CwSYcsMQ0nXDEoYB9ONx6BeYbJkLDDCukaVgVIV3CySNSms=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyf1jXS2qtj5XgO5iysGMI1j75hAOCAJh406mTR3RwextJy9l9L
	QU8IWkcj1Y2dUhPG2Kj9jB0bl1k8trLGaanDKNInN1zP5vI85J3DM6HUWU4+Lg==
X-Google-Smtp-Source: AGHT+IHvBkaWPQbVKiD/u2iOrMRkK3daurGtkkhjknrAX1KIWB3cA5A9a8FHevVPAdBTGyigNIjY6g==
X-Received: by 2002:a05:6214:3a88:b0:6cb:2e94:3e24 with SMTP id 6a1803df08f44-6cb3b5b7edcmr189314226d6.11.1727697918247;
        Mon, 30 Sep 2024 05:05:18 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:33 +0000
Subject: [PATCH 38/45] media: i2c: max9286: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-38-81e137456ce0@chromium.org>
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

The following cocci warnings are fixed:
drivers/media/i2c/max9286.c:1333:3-9: opportunity for str_on_off(enable)
drivers/media/i2c/saa7115.c:1366:3-9: opportunity for str_enable_disable(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/max9286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 9fc4e130a273..d0f542343344 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1330,7 +1330,7 @@ static int max9286_poc_enable(struct max9286_priv *priv, bool enable)
 
 	if (ret < 0)
 		dev_err(&priv->client->dev, "Unable to turn power %s\n",
-			enable ? "on" : "off");
+			str_on_off(enable));
 
 	return ret;
 }

-- 
2.46.1.824.gd892dcdcdd-goog

