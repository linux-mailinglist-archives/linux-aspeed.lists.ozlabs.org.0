Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE63598B031
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkV724Gz3dJn
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697847;
	cv=none; b=cqbMhTAaDBqHPtRyBF7ouqZ7fCXS94xHyL1i9Cp1CNOhQlRvv5f623JTKSMdX4/BCZUAnaraN3gEMClpMLPQ+aL6QbwjJarUl1stw5bNw6pRj76rii4ZXBfmaIGMsPtKEjbDShDvxNYMUTVPUwH9CL9DVwwzDgNS0CqqkLGBVmg/wuWXH3r0Yve1Z+cLPA5kApSR/oOsUBZXKm2tEuEI8S8tSuaz29DAjZuQmhDFvBV0cjPkHEpmk9LQQAIlRGgBezew+zyFtmlDFqysxiMUPaiVL0FTvq1ZiYEAq/QqpqiC8JTqpqC/IhsnbYS8M4iRhZ/CLf3ZyRrbH93GMV8pmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697847; c=relaxed/relaxed;
	bh=U/d/VxAIFFwk8ny3jYVhNIfPO7NwT5z32rk28KK4f8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CkGBQcX72Niw3jo3j+w6DWI6QCEdsS1Jzva7a+jC5K2PzE1QcLRjfRbpimtz5BArWxNB1HfAZjAscKjI77/5t7Ns3K+pEx5tSiOLF39emo9pN5ZXmWyNi+ge+FHRNpqtHsd03VuzCHFrPeBOb2Yay/o4kymUOP3XV2iByUgLWvE9nCElAGOjKMjs7fpTd2J77iQKHVloGgksXZAxkOZJ4yFLT2MDIDZT616JVbpqMkIIDZzin9yzv991q+g8ef5v1Ex4Pd89/UB9njd4WDBC/jGA6frM+PpI2++IwFC6yoxJrXF0OFxhA7+LR7lTOeXsRfJqNVT/bmr62spG5cr+tA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IcMIzj8B; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IcMIzj8B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKVZ5HV1z2xFn
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:06 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-710d861eb56so1976455a34.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697844; x=1728302644; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/d/VxAIFFwk8ny3jYVhNIfPO7NwT5z32rk28KK4f8Y=;
        b=IcMIzj8B52oZBHL72Tm/NxE0FNUV8N7b+7gx/AX4bObDb9/XlK4oe3aAuqQHAHRJT7
         Ku1/xlt6WfrYtZphdYy2MaJtLL+1lqw2snt66c+Q1sFicMzR0n6Ns6H81DczM7yzj8CS
         721uMjrDvAXeRVtnQTl2Ef1WPs66hIubkQWto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697844; x=1728302644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/d/VxAIFFwk8ny3jYVhNIfPO7NwT5z32rk28KK4f8Y=;
        b=a4ZepmpRsc02EoCOCz4mrhI9ThYEuBjeirJa2z39fLMaQxpLZ2pxN3XuJDA82H6ZgD
         5G4oNiX5E1k2WH6Lkx8HiqXRaoLRaKyAPII5ie4eeBJKO1ZUVuDS3E6SMrTGZhqbVT4S
         wi42vHSUjTe6pPFv0WLGYdYkNy+4giGAu6f5JvrTUxTwxCDEp8kOwqrMojub10FZJtux
         SLfMM8i9yqhPzN9DCaVEArmYHyNtUMaGRZH6Ry302zbU0SrfZUmVignMMgil/452OySz
         rDjXoRDx6JxUYYtH2SP41C2I25m8PCrFD+I/9DLfwt/xb8+ep9TDcgeLY30lmUv/jxsz
         /3DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWODyE8YyjiYULpnJ2isRl7Atrxd/+f7qRz8heiaSlsWkDgnX/Kh2DKwhezzc9pakLF8iFuhB54C6tuFFM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyExTZu3e659p38bClA+opx5kodKuuziZAT6xMpw+qfNHrnSONf
	wN94qA4JrVwgtnjaUdEYK7RAqKKOnWG7UwMVzQ2gMqWu7dYsP4rqBRv2CDTKWQ==
X-Google-Smtp-Source: AGHT+IG/KAG5rLZearz2Wa+2ErVyBcttWaRGk175qbpKywxFfy3PRamVmOosYeNbd61Fqm2746wGGw==
X-Received: by 2002:a05:6358:4314:b0:1b1:ac2e:af69 with SMTP id e5c5f4694b2df-1becbd0a143mr332064355d.17.1727697843926;
        Mon, 30 Sep 2024 05:04:03 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:03:56 +0000
Subject: [PATCH 01/45] media: staging: ipu3: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-1-81e137456ce0@chromium.org>
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
drivers/staging/media/ipu3/ipu3-v4l2.c:290:3-31: opportunity for str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED)
drivers/staging/media/ipu3/ipu3-v4l2.c:305:3-31: opportunity for str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index e7aee7e3db5b..443067ad0a50 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -287,7 +287,7 @@ static int imgu_link_setup(struct media_entity *entity,
 	WARN_ON(pad >= IMGU_NODE_NUM);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u pad %u is %s", pipe, pad,
-		 flags & MEDIA_LNK_FL_ENABLED ? "enabled" : "disabled");
+		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	imgu_pipe->nodes[pad].enabled = flags & MEDIA_LNK_FL_ENABLED;
@@ -302,7 +302,7 @@ static int imgu_link_setup(struct media_entity *entity,
 		__clear_bit(pipe, imgu->css.enabled_pipes);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u is %s", pipe,
-		 flags & MEDIA_LNK_FL_ENABLED ? "enabled" : "disabled");
+		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	return 0;
 }

-- 
2.46.1.824.gd892dcdcdd-goog

