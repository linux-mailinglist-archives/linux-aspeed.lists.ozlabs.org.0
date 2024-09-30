Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C0E98B047
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkg0Qr1z3g1c
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697895;
	cv=none; b=VKhc44PcC+OzXTE7BaW+uK6EOv1bLaxJFWs2Sy/uwt+BcNqb4cUxTQOGHcy66QCjbceRxB0svS5rGn8tQIxB2pb56JxceXlUofXzUfQK92djjK/KKLV/FO1BJVy9e7XHYiXaS6qoLh8aNBZSmXJe5kkyqMpRgEipUdOuQ2+a+1gAL9p9OdTd+1+oxNH6+nPNm8kGw36+oTrA58SH7wAo0ouYhw8XC40RAJzyLUQyn8bPAmZFJjakbVhEjGuSDFW605dmB1rRAOty01Z8FTnBq/KIqXG1Fv5nl6B91MnnIkGAPuQtg4ANA3T13pj8UHl242fY0FIHaX9N2x41Si27tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697895; c=relaxed/relaxed;
	bh=fkGnsANo5NZRR329f/RKKIwKl1Ms+i/uz0ChSSNIXaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QlvJT36mtFscxOmdhSFhbapH3ZZTJCaEHW0A67IrouL9d/WMO3WV/ZzyI601+l28+uaJ7BY2oHKAP2oOMd/DKn5TLA0wy0k6EbnsoBR9AGS30Kh6A/sq6K9otsyDBJtQUv8TXFqvRLH6CoUNGa6iArpYB758EWXuG67HykV0qqtZghpBjzMD9v8zI6tWraX2FQm/iWVB9sc6iQPr768GL1+EsVqYxqi1Ec0A3rXaCYQ7KVDY3+s5JFmwK41fQCZvQ2Dti2bz9oBtjOPHdOvs4QsCREk/CzJpLdHilEF2AQMnVCyWFiSHRTgAqnChkXbAHb6E6XUdC9EqMzNSSw3AkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=b8hRsMxU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=b8hRsMxU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWW03jCz2ydQ
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:54 +1000 (AEST)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6cb2c5128d5so31324186d6.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697892; x=1728302692; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkGnsANo5NZRR329f/RKKIwKl1Ms+i/uz0ChSSNIXaI=;
        b=b8hRsMxUxc9pk4qWozbXyGL3o8JHjb0MrY0Wlr16YJdrMjUUjePnZtDjSkGBNjXEZr
         ebMj02nU3aEV9Akanfiq7GrsOmlBsyc7tCC3fjZ9JhGYI+FdwhSu65ttAXFrWW0Kv0JB
         LAUi8p7hdsL6ZSPj+sDmMlQOBRgegqA7TISw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697892; x=1728302692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkGnsANo5NZRR329f/RKKIwKl1Ms+i/uz0ChSSNIXaI=;
        b=cIlT8WWFaCz0hjwv3xjSbH8/ZkIHw0rCTJHFQFB4OAPApTsXilsjnX5xMbYxYKuljU
         h/nlglmjesllrnDAqO82H2B30e4T9h3U8MXy00gHPr/DdTjGM/WgbImFe5c+PW2gy65k
         rkF6Osd4LTbCquk7E1/V3Wt54kwvtjYMG/FRA0FJ1VR7cc6kzgqz5lWoEUtrRAe7kZBI
         Gx0EbMznVmAR5J/Ij6cpsVGXvntlVeltQ3BKaq5mlIIdQZv78PFIAxGvFaOE3Cq7LFn4
         kak7tVGRZpuIoP5rgmDKdhD+c4k0rIYTevEHs6gZ8jBoSM8zM6EpabDL9jC6EBcbOZyk
         7oEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3H+Qe1gfzAoS5hyFXMzDfo319ruZ0Vbafl1FzAPtDotdwn9nVqKb+ybMIYcm6Kt5rbCgg+HpLHqUt8c8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwzOcLUXns4aBxQx8QWmNiChDbra3B6WY2LJjwn3nH9yqOwIc75
	ADbKbiiGOns1xW06CNuMllJcL5/v9fh8DJw9KpKzuK9ybbCmpdxW7xLseQKstg==
X-Google-Smtp-Source: AGHT+IHSrAGEQVH1G1zMvd/O9AA5MhvLH1UshVFh4gerMrNNX+7ODpeAcur/C3J29WO/FfgVZP2azA==
X-Received: by 2002:a05:6214:33c5:b0:6cb:4def:4ce4 with SMTP id 6a1803df08f44-6cb4def4dd3mr121217066d6.32.1727697892043;
        Mon, 30 Sep 2024 05:04:52 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:18 +0000
Subject: [PATCH 23/45] media: ipu6: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-23-81e137456ce0@chromium.org>
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
drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:247:51-57: opportunity for str_on_off(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 051898ce53f4..522dbf52c82b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -244,7 +244,7 @@ static int ipu6_isys_csi2_set_stream(struct v4l2_subdev *sd,
 	u32 mask = 0;
 	u32 i;
 
-	dev_dbg(dev, "stream %s CSI2-%u with %u lanes\n", enable ? "on" : "off",
+	dev_dbg(dev, "stream %s CSI2-%u with %u lanes\n", str_on_off(enable),
 		csi2->port, nlanes);
 
 	cfg.port = csi2->port;

-- 
2.46.1.824.gd892dcdcdd-goog

