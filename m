Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC6B98B050
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkk27LCz3g8K
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697910;
	cv=none; b=WNc/X6DDoDZxBTVzZRYPnpmPB4vVIkaw5Uim8GsDjgoa6CiC4KOlShvjlECDsIB2t2SxB7YUVcxa08P9U7XetCR2GCr37IqPDW7rAAmEHSq84mRWDUSwfa672B7A+Y8oDeyxj++F3gP7CaKO1++ryXooxKpbXfwMS1dOrU0xsbrr5g8MpWtSTMcKdCCVyBjQzGIEIrgCa4CIM8XG/avndpV8hZABZm1dCyPpoOzQ+cMX4SNQ3IpVXQ+7ECutReB6G//nTk1e5jfNQ8GiWnbkXNsNby6iL7rgKmoZylpiJ8LDssmU3xvwLY2SOz2f04vWJqO7MpSUU1aXJrPD+Tueww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697910; c=relaxed/relaxed;
	bh=tASyZsxMamepS+/aqpGaV+hKbka/53sBNF0loAvAB9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NUMV78xshlV7d01zjfo8PWyoINGuDbo2GiV5zXc39uonBqGU8oQtod+nOLgZgDZlSGPcT4CHgAjesOD+RRp2KV01zDsRpCGI3wjytySLPdKQIsNpoW15NowhJTufvJfW/SQtdhRjHLcgmFvvsEqr41OelmD4aEcNnCyuxioWdoVn6EOWlkjVrygYBmEWNAqWyYJ6NuDPAWJcELMHvpAWLq/x4P2vstLz3CYgB3Udz/5MnfIRvkhBPqMgZuOd/VhexOgzipbxJk/hz1jA5+rqSXkh+igBM1YS/8vmF/nUBASe8vbYQ12fLwLGrC+N++Wfn8nFoRIyiacV1pOubDRvvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HADF3ZeH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HADF3ZeH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWp3B7Jz2yhG
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:10 +1000 (AEST)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6cb2f272f8bso40066276d6.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697908; x=1728302708; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tASyZsxMamepS+/aqpGaV+hKbka/53sBNF0loAvAB9A=;
        b=HADF3ZeH+6Ux5ddy6Xcz6DA4p0NZGCy4EpZhhUJeBl1Sw6aP5TdTt/APuZ1cuLsbEX
         5MlSPhAA7R8V52NmqbNBExuOwyXmp8GlLohObgAUo92hPSnaW7n45y2sji+XjEvvchH+
         g39Li8fQrd6XuqLaA3RVVTS5mW0u6r20F7rEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697908; x=1728302708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tASyZsxMamepS+/aqpGaV+hKbka/53sBNF0loAvAB9A=;
        b=Yf6baUNTr1eEX4cHEjU2CXPcllaa/xhPQqmQjotImc8R1MOizIBcCBgOn2iBEUVV9n
         h9whtDVAuwbFNif+Mqhe/13nLxxgr5zYPZNIZJmobmWI2KzCAtYXs+5miIoK4yA70xBD
         X6rh2qG0Y1RKbianq+Cc6jjMREdLky5/cgb63cfOoC9ZOLFqNbYpEShCpnsVqu/1lRQf
         fNOPdczgC5drAYfYx+v/WM0taVdk7Jzhn4hgF1F49NrvQcsJD8NU7XV/QRPlG+Lsx6PS
         dfEihwbZkM32La5FWMeZoBRig/c1LIb7vngblyLCh0VjzuVbXaKf+bFfvXCvo7n/xKAf
         B2RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHyjuJSrnwAk2iBw0AMygPh/Yc4Rqk/cprhyQsCRZhD9Flz+UYvSpgrBFwQrwReZOoDmJyfre4KdZNr4U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwLOIOURDu/1EA9jkJU12QuoaGSxTKyiRDYpPxYSELrU9RLJ/+Q
	AdM5as1lnt9KzaF0SsLAR1VhE0O1EETk8BQj+XM2rq4ohV2zLVQrTrVBoa0nzg==
X-Google-Smtp-Source: AGHT+IFjm/EtrgyOgYzJ6FCtv8A70AwY6h/u/nfabbLzk2VgNMjTcGoqCqNUVQwkIEHXuuvTS3xGsw==
X-Received: by 2002:a05:6214:4881:b0:6c7:c645:df60 with SMTP id 6a1803df08f44-6cb3b686f6cmr211008966d6.41.1727697908426;
        Mon, 30 Sep 2024 05:05:08 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:08 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:27 +0000
Subject: [PATCH 32/45] media: i2c: tvp7002: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-32-81e137456ce0@chromium.org>
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
drivers/media/i2c/tvp7002.c:775:5-22: opportunity for str_yes_no(device -> streaming)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tvp7002.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index c09a5bd71fd0..2acf93a90c34 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -772,7 +772,7 @@ static int tvp7002_log_status(struct v4l2_subdev *sd)
 				bt->width, bt->height);
 	}
 	v4l2_info(sd, "Streaming enabled: %s\n",
-					device->streaming ? "yes" : "no");
+					str_yes_no(device->streaming));
 
 	/* Print the current value of the gain control */
 	v4l2_ctrl_handler_log_status(&device->hdl, sd->name);

-- 
2.46.1.824.gd892dcdcdd-goog

