Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C5498B032
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkW45Bzz3dSr
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f31"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697850;
	cv=none; b=OUefnziTKNsToHDfnamgolnD0kzdIirOmdZ8h6HDlB1hOOt8z4i0ty8/ZWv0RKIv7p6HYH9xmEcAjo3PBRyJGXmihVCLNva41GLxfQURLBGbvhWwYjmBXeXME2+oHbIcqua/vsXnBsQhts8OYf2K7A6v2Bf8eZcXL69+DYEQHe5atSgjICPj0SHzreEUnWmQ2b2O0IKKJsgfSoLf+wvzIEpsWe+7Q+wk2TkfJ1UawXKKyfJCrQhukncQJxbgI1CQfRpUsbeDuj25yjf8i5Mx6XlrC4UtGk5XchrLUh3VGG0tME9OoxHmXY2M0Tzhdf0gah/xAI8FYPN9jBjikbklxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697850; c=relaxed/relaxed;
	bh=RMPmE5TkHFd80YgqTri0+sfyqDiwarpX0eHsAVhj80Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=doKrB1CrK2XcBI6PKSrEXbzuFgMnn4KolPgqfkEf89rrBY9V7Xs+mPRQbVFG/ZKvI/C4i377cHs+ZzbUnzjO+SyewHD6TF6chl9AfoEO1QUappF0i3fgBqjNegKHelZBqCXyieqYTkfAqqEywuofVaFAE7+k4xTb0z61KI/IaZ3InP98n993ATM4bzYKUtOlS+9JMs9UYpni6fixiNgwicKCUeJJsC5to/PIIjyX8xvUcXR1oeSLItOFo4LsbaeSWrczOi3XsxYL/8bZaXYPZSuerUB4MxuT3RmIv47p2kodK4CErXav7gUcaO6JQayR+1VBWqy2Z9Psiab0E/1ykg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EZIdIiMF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EZIdIiMF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKVd3yJtz2xFn
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:09 +1000 (AEST)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6cb25aad5dfso40844706d6.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697846; x=1728302646; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMPmE5TkHFd80YgqTri0+sfyqDiwarpX0eHsAVhj80Q=;
        b=EZIdIiMFLN92n4E+lGx4jWY8ujDLKNavkIwKVsbKXyLQM3e0YSmLRKi3pDVwE4047d
         oA6gPEyWcBYniSeTxvoK1WeIm4r3bzSOd4477t3PGFN53Zmis1Xk26N8UfWcULGWqxF7
         vlf5sT2bAThfczrAFA9azfzdAS5AOxubjJ+vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697846; x=1728302646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMPmE5TkHFd80YgqTri0+sfyqDiwarpX0eHsAVhj80Q=;
        b=q9nE1iM7CnvRh50yxeoDqu+AV9zMmW1kY+3WnjkLJTJNoDaltLRu/maLDVds/qPeXD
         62/AzDMlzD5eG273E6SPcVXtsQImiJo6QM5RiDtRauo44fmx1hDxa6I5v+g/56vvs3tY
         dNaUJ42xd6TSFVoYPZM4M2A/2zZiyEH+H8ZQpGcMWZUnI3ngvEmTGP6l7edVeY1PnCg1
         RdfJW6jvjucKO7R7Y6BoAcI4t7HG6IUnqUtq7RSJuKHL+KZp+vkQCZwLnk7YtUn7YtW7
         xs7/xTxECoH2WScJrb6RVBqjHqEb7T/BAS/qD1TltYFEIHFO8EdEqCTI7glx8JPcSBpE
         UNrg==
X-Forwarded-Encrypted: i=1; AJvYcCVIzHtOIww960W7eaNkPR8lZu1bdpo/jJPEh0QfNqHTQtk+2aq4jUsySZBaTYWSR3uyjBXVhn/7u2ZQa2M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwqNIGfgJFvILyWSc2nTtzDMbQMwjGvuKvDwGjqMm8SHWuaz8fr
	JGP9AXE+Qilz3hhcYLtmSTWbX5xhy7v7qUcw7+KArG2LFovc0eLEFvY344/Zpw==
X-Google-Smtp-Source: AGHT+IH6/D/fn5XLACymMtvSYJn9uYVBCFXPJs1Z5DofbyQa884ygogtE2Qn3wPmK1ZC7+LIXRRj0g==
X-Received: by 2002:a05:6214:4905:b0:6cb:4ee5:8a80 with SMTP id 6a1803df08f44-6cb4ee58e92mr128655486d6.34.1727697846439;
        Mon, 30 Sep 2024 05:04:06 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:03:57 +0000
Subject: [PATCH 02/45] media: staging: atomisp: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-2-81e137456ce0@chromium.org>
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
drivers/staging/media/atomisp/pci/sh_css.c:1490:16-19: opportunity for str_true_false(map)
drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:855:2-8: opportunity for str_enable_disable(enable)
drivers/staging/media/atomisp/pci/atomisp_v4l2.c:542:40-46: opportunity for str_on_off(enable)
drivers/staging/media/atomisp/pci/atomisp_v4l2.c:584:48-54: opportunity for str_on_off(enable)
drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:1006:2-4: opportunity for str_on_off(on)
drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:1019:3-5: opportunity for str_on_off(on)
drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:394:9-19: opportunity for str_low_high(active_low)
drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c:1253:3-35: opportunity for str_true_false(xcandidate -> sp . enable . continuous)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c      | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c       | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c     | 4 ++--
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c              | 4 ++--
 drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c | 2 +-
 drivers/staging/media/atomisp/pci/sh_css.c                    | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index a62a5c0b3c00..34e68ea1b1f4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -852,7 +852,7 @@ int atomisp_css_irq_enable(struct atomisp_device *isp,
 {
 	dev_dbg(isp->dev, "%s: css irq info 0x%08x: %s (%d).\n",
 		__func__, info,
-		enable ? "enable" : "disable", enable);
+		str_enable_disable(enable), enable);
 	if (ia_css_irq_enable(info, enable)) {
 		dev_warn(isp->dev, "%s:Invalid irq info: 0x%08x when %s.\n",
 			 __func__, info,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 6abda358a72f..7d1905791b9a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -391,7 +391,7 @@ static int atomisp_csi2_handle_acpi_gpio_res(struct acpi_resource *ares, void *_
 	acpi_handle_info(data->adev->handle, "%s: %s crs %d %s pin %u active-%s\n",
 			 dev_name(&data->adev->dev), name,
 			 data->res_count - 1, agpio->resource_source.string_ptr,
-			 pin, active_low ? "low" : "high");
+			 pin, str_low_high(active_low));
 
 	return 1;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index e176483df301..85e7d14ef394 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1003,7 +1003,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		return 0;
 
 	dev_dbg(subdev->dev, "Setting power state to %s\n",
-		on ? "on" : "off");
+		str_on_off(on));
 
 	if (on)
 		ret = acpi_device_set_power(adev,
@@ -1016,7 +1016,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		gs->clock_on = on;
 	else
 		dev_err(subdev->dev, "Couldn't set power state to %s\n",
-			on ? "on" : "off");
+			str_on_off(on));
 
 	return ret;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index c9984f1557b0..6fd18217df1e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -539,7 +539,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 	u32 val = enable ? MRFLD_ISPSSPM0_IUNIT_POWER_ON :
 			   MRFLD_ISPSSPM0_IUNIT_POWER_OFF;
 
-	dev_dbg(isp->dev, "IUNIT power-%s.\n", enable ? "on" : "off");
+	dev_dbg(isp->dev, "IUNIT power-%s.\n", str_on_off(enable));
 
 	/* WA for P-Unit, if DVFS enabled, ISP timeout observed */
 	if (IS_CHT && enable && !isp->pm_only) {
@@ -581,7 +581,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 		usleep_range(100, 150);
 	} while (1);
 
-	dev_err(isp->dev, "IUNIT power-%s timeout.\n", enable ? "on" : "off");
+	dev_err(isp->dev, "IUNIT power-%s timeout.\n", str_on_off(enable));
 	return -EBUSY;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 7ce2b2d6da11..7e295bc83464 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -1250,7 +1250,7 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		dev_dbg(atomisp_dev, "Using binary %s (id %d), type %d, mode %d, continuous %s\n",
 			xcandidate->blob->name, xcandidate->sp.id, xcandidate->type,
 			xcandidate->sp.pipeline.mode,
-			xcandidate->sp.enable.continuous ? "true" : "false");
+			str_true_false(xcandidate->sp.enable.continuous));
 
 	if (err)
 		dev_err(atomisp_dev, "Failed to find a firmware binary matching the pipeline parameters\n");
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index ca97ea082cf4..89a694453e6f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1487,7 +1487,7 @@ map_sp_threads(struct ia_css_stream *stream, bool map)
 	enum ia_css_pipe_id pipe_id;
 
 	IA_CSS_ENTER_PRIVATE("stream = %p, map = %s",
-			     stream, map ? "true" : "false");
+			     stream, str_true_false(map));
 
 	if (!stream) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);

-- 
2.46.1.824.gd892dcdcdd-goog

