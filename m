Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E89E998B04F
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkj6rMrz3g7j
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f32"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697909;
	cv=none; b=Ou/z9nPXJMZwIo1js1IcpF80jWOQC9ToSQl885srF7YCwYZBBc+Ot1T9vFVF20AbT80r+rDH2OOUso3JjPbd09+jNOpgzv1iXV7UQ1n/4PNmbqteMS0GsRdrGlQHdE0vpjsIAzDWI0iKD0CX6CuZzRzd8XrwoeZ75lz5a8coW5KQu3MloTURgvfmhU/SxqG5SH8Ow7xurZD1Q/Wh3RVC4Z0+OXaW1mRGvPmEuBr9016ooqNrl1ohAlPV2aivC6l0sHoUZLBkzXYKPWz+VgwsYhq6uRQgjuf6jV73kc7ygA4qLPoJuFbYvXzjpLuhdEnffgqCaNNV5ulWZMj2akd7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697909; c=relaxed/relaxed;
	bh=yeZpI3Ra5CG7IMhE/CKrUPUz5revSFC/2gaO36DfqMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eC6H2ujjnIyCedTOF81BZhmy8xXm/upf0kTwLKrl5etmIaxRIzKH5B6/Lvz8DGv7vLL3PsS0YKJEEbbupTv7gC/e3HojOZsRm7XE4ph3vL8+N2s8megcAvoGJH0Ppcc8rYHQcQCzPNNdR+/RSM/WRwqKkM+eKkZEjWcQsmyFPudkX0jYc3bFScT4JJ3++hfawcT8oce/j2tIEJIQBd+xjccTUmuGq9MZI1A/MZpuXa058k//h5Fx9coJb0wfHXz5yeyDbKPgkTYi88bolIGQaSz5kBgrjoF20bkptN+6TtNMjOKPusYupMTlecXx2wUb5OwGd2UTX4mC9EEpMRHbZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q4xOpktr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q4xOpktr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWn2LfDz2yZS
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:09 +1000 (AEST)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6cb2e136da3so29189726d6.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697907; x=1728302707; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeZpI3Ra5CG7IMhE/CKrUPUz5revSFC/2gaO36DfqMw=;
        b=Q4xOpktrt+ufhWhadaNL/2TJ03X3+QKBI6PmtLPjEg3IBgWy/SMv/ihv6UQSFmuP/x
         wDsBseXxEe6R/2rz+tgTA1pHJEnwih0eL0FPngj6/kV3d3fw6/usT/g70E9peSAntYex
         PO9QJJGvkbJ0oJGOlJAfsGI+pMmKUnLSOvxH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697907; x=1728302707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yeZpI3Ra5CG7IMhE/CKrUPUz5revSFC/2gaO36DfqMw=;
        b=ALoi5S+XMJ4aoQKOOHhbHEtk9Pt3K3WEjkMxgOGyD2MvGJibyNH8lzzy3Yzg7tFUJW
         21l9r7hxPHYq8MG/kXM2Xc4lXOcDJfdL7vHoO5mL20Meq9aeyRIL91vnE9GroZRWAuv+
         N8KY/0mikmeC8+cSejytUDfeUL/hFlwAV9ryI4OqOxLhYBk/0fBCIGhcC33GXFCNt8E5
         ykalERUGLuV4jRUrEnqLPI/arNxuKRG30et+IPpN1oG9fP6huBrjQIIQSJennFtB9MIo
         6OHMATOVhm5K1omb/euIrLV9Gt6/3tc6CMBib774W5zoT4F5pXjYw2XgJuRlXZNZfctQ
         ULSA==
X-Forwarded-Encrypted: i=1; AJvYcCUS7j6SaenS65KOKWkWSsxsaUm/XdwaCW6GoFomRVS7GmDtSBa+MhYTvUbmcwk4XQr0D9e3nm7RYXEtKz4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz8u0QisnVKcjT/rwHiFbMVgXYyksXZtXQOIB4StIY5aBgEy2Xm
	r5FPZQ4Sohh7K6TSuv1R0NYRzSFD47HN2lEaNTKVt5B0BIqfDyUyvG+ZX7UPbA==
X-Google-Smtp-Source: AGHT+IFyOtAPK8xGQ/QMRxJMYu6WDsr9USOQ8VSoGNgApI/9s4N+ulaKyT/ysJasxumVieqsjFFOrQ==
X-Received: by 2002:a05:6214:3f84:b0:6cb:455e:da5 with SMTP id 6a1803df08f44-6cb455e0e83mr174779006d6.45.1727697907195;
        Mon, 30 Sep 2024 05:05:07 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:26 +0000
Subject: [PATCH 31/45] media: i2c: vpx3220: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-31-81e137456ce0@chromium.org>
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

The following cocci warning is fixed:
drivers/media/i2c/vpx3220.c:404:41-47: opportunity for str_on_off(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/vpx3220.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vpx3220.c b/drivers/media/i2c/vpx3220.c
index 5f1a22284168..c5b031dd59e7 100644
--- a/drivers/media/i2c/vpx3220.c
+++ b/drivers/media/i2c/vpx3220.c
@@ -401,7 +401,7 @@ static int vpx3220_s_routing(struct v4l2_subdev *sd,
 
 static int vpx3220_s_stream(struct v4l2_subdev *sd, int enable)
 {
-	v4l2_dbg(1, debug, sd, "s_stream %s\n", enable ? "on" : "off");
+	v4l2_dbg(1, debug, sd, "s_stream %s\n", str_on_off(enable));
 
 	vpx3220_write(sd, 0xf2, (enable ? 0x1b : 0x00));
 	return 0;

-- 
2.46.1.824.gd892dcdcdd-goog

