Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 342F698B038
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkX6245z3fm8
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::730"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697858;
	cv=none; b=cgo5tlO2vl2bXNjNCSKG4wdiYmxCSSzYu1tyR7RYLvn/5Po3aua1vqHhn/4vNf+DeSiAlAykwIFhwYiTzBHWsQzr5W+xk5Lo+UN+gaci4eonn6UYh8TBuLI8djrmsJBd0wBpMFKjgwToMsuTm9DWSq8kBdjH5RbeOSOB2nRZdMy4NvUscIg77p1UcosiKDUZ3V2Ja5yZPmVeBhshrlhKigpF13y+2Rou/HNKUbrkWD1v6R8KP2+giNijSeYkaiott70YjuOpCQpzQ0aDo4smy2uXGOnMBXcAS7cVTkTm4pYVgvl1LViq3xVuObEW4Slt//b48/gibzN3Qr6/D/w/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697858; c=relaxed/relaxed;
	bh=qsuMyrkoVqVku50v1nfIbGtDSp7S7nG6aU9K9Rp04Bk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zuf3AH+zSKJ7qHmU7VyC+tQ1+6P7KqWQ2DdONses/rVPHCl0d+zDYfUCx+uJ0KXRm+3LoapdIJl68vnds6eSCHC4B14VQRtXJD7OvEw//X7oYPPlIiciAk82swZVezM3Jh5u+/NUXUrO0NfvgEkP/AZxRutTbX3RhLfTZ90G22NcPUB/t8rKBsanR4qLukdU3Fc/VQozJ6lSoVhLnv9N0wMrZqg+Bf9V5tDDGSW/GrgHcYlfoDJti7BCpmDHx7/aSIYFHoC5sowZo60GJX4DEMryUL6pT+vVvKZs1JCgeRuYDTb0a60dMc54CFlAVy7x9O8n6RKwrk4NumdXduv1bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=I0YgwyJE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=I0YgwyJE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKVp2tndz2yNf
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:18 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7a9b049251eso341451585a.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697855; x=1728302655; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsuMyrkoVqVku50v1nfIbGtDSp7S7nG6aU9K9Rp04Bk=;
        b=I0YgwyJENYbo84DujTQMf1oGd9vfEy5JaK5lc48aUpaMAiqe66gsybAXz/iNfkFLM4
         0LVzm4aB78h8+taAgYy8mU9MJmGzkyfh4GxxZz2BEx+JqSCrVKLGlUDMRyUXpAA2Y9B7
         TbmRGDv6kkXK3E7E0HtCnFxINHGziXyNOBtzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697855; x=1728302655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsuMyrkoVqVku50v1nfIbGtDSp7S7nG6aU9K9Rp04Bk=;
        b=oMv8p0yWknCBVzCjWvDETg/DSy8rozio6jFaFCkGh9OcueX5/CJGGVjqJF7smFBqVA
         cmVHeXCETDSILiUZX9m6sUZYJ6q+9dIfxNhkWaBaqMO727ijRt4Ibf12x7+DMad6LF8Z
         kACjqt5n+L8pGuzZ3ATkz7Eht2GzJiMN8yldd/mzkxKLVGEEGEdtDVEsQlMoKnQpIede
         GgxnRtcEW699nV+elSy2sqELawm62WA9P9ZkF3eGhluf61Tk8DwBPFkAzRVnekiTFPKn
         4rO/mSt+Em0YPTTGe0TDHxu7dh7phwiWUntguSp0rxZQ3fUpqvEv4lCjjMXjp+bewNY2
         Ibsw==
X-Forwarded-Encrypted: i=1; AJvYcCV9mW1Rb66jkySVVW7zsZ9VpYY2/aDeP9q0sAlm6Uym5Vv+f4TphXuM7jS6mKb0hcHrMGFhOEzHSwulY1U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzbNhaiawMm346pEISljC/5oqJ6ZaWJ+/bWKztt8D8WlbXpEgrQ
	24kSC1ubCjg8cZCCsxOZqhheOaPTI+RRIszD7NrMLB1wokiJPKGH8aq2J3hAwA==
X-Google-Smtp-Source: AGHT+IGbIk2oHMQ7FRb0GeJel1Jh9P6FVq0oOGmExjq89yc9rCz3p632i5Dvmp6LRIkRrX30gKUAOQ==
X-Received: by 2002:a05:6214:5990:b0:6cb:3925:ec95 with SMTP id 6a1803df08f44-6cb3b66d1a1mr155459916d6.53.1727697855060;
        Mon, 30 Sep 2024 05:04:15 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:01 +0000
Subject: [PATCH 06/45] media: em28xx: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-6-81e137456ce0@chromium.org>
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
drivers/media/usb/em28xx/em28xx-i2c.c:579:3-29: opportunity for str_read_write(( msgs [ i ] . flags & I2C_M_RD ))
drivers/media/usb/em28xx/em28xx-i2c.c:590:2-28: opportunity for str_read_write(( msgs [ i ] . flags & I2C_M_RD ))
drivers/media/usb/em28xx/em28xx-video.c:941:4-9: opportunity for str_enabled_disabled(flags)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/em28xx/em28xx-i2c.c   | 4 ++--
 drivers/media/usb/em28xx/em28xx-video.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-i2c.c b/drivers/media/usb/em28xx/em28xx-i2c.c
index a7eb11f7fb34..62fe49876a32 100644
--- a/drivers/media/usb/em28xx/em28xx-i2c.c
+++ b/drivers/media/usb/em28xx/em28xx-i2c.c
@@ -576,7 +576,7 @@ static int em28xx_i2c_xfer(struct i2c_adapter *i2c_adap,
 			goto error;
 
 		dprintk(2, "%s %s addr=%02x len=%d: %*ph\n",
-			(msgs[i].flags & I2C_M_RD) ? "read" : "write",
+			str_read_write(msgs[i].flags & I2C_M_RD),
 			i == num - 1 ? "stop" : "nonstop",
 			addr, msgs[i].len,
 			msgs[i].len, msgs[i].buf);
@@ -587,7 +587,7 @@ static int em28xx_i2c_xfer(struct i2c_adapter *i2c_adap,
 
 error:
 	dprintk(2, "%s %s addr=%02x len=%d: %sERROR: %i\n",
-		(msgs[i].flags & I2C_M_RD) ? "read" : "write",
+		str_read_write(msgs[i].flags & I2C_M_RD),
 		i == num - 1 ? "stop" : "nonstop",
 		addr, msgs[i].len,
 		(rc == -ENODEV) ? "no device " : "",
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 4aef584e21da..ff017c187aff 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -938,7 +938,7 @@ static int em28xx_enable_analog_tuner(struct em28xx *dev)
 			dev_err(&dev->intf->dev,
 				"Couldn't change link %s->%s to %s. Error %d\n",
 				source->name, sink->name,
-				flags ? "enabled" : "disabled",
+				str_enabled_disabled(flags),
 				ret);
 			return ret;
 		}

-- 
2.46.1.824.gd892dcdcdd-goog

