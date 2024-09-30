Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC5D98B035
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkX3cCkz3fVw
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::731"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697856;
	cv=none; b=fPCumBUixiphg1zHaUm1V2Lg9/o76lviCERpyCEPBpDk3RgPgazCk5GEUXdn6M3jxySYA4SwvnreFBwCjFccbyThzMqTGtj6woEyL3aj0IUXGzmspPZ/gBEdNhW9Eyv/9JWPSpaqNY0ByNBrrj7+qvo5ng7RIlmm5Pq8Vb6oFNN9+hYZoQwSyQJRX/0kgKyP+qKX485yCDqxZnOwhBgjwsz+na7k3wOTmtkP0RY2V1S2r7lmSzvskWWvOXMe3SasRwr00+lbfEWi8wttLniLomeISpu6UvsE7b8j+SI2rOjPVMQ5G3EGV/MwfHiPion2DolQW1cjxFZaPxNddZgn1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697856; c=relaxed/relaxed;
	bh=Vb+rHfycpw6eqzxAcjL5Q/NM2Cf8FBszS0leZkajSd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HrKm9sQURR/xi5ZoXxJ+RPsXwPj92oOmyGOZCH1ZRLpRjHiQSY9wQfUYuN/c24ddkBMikvysGe8ZX8rmzIwR+LI7oTV0dm9Ahn06Ma1ewoqcoVOpDrl5q1ukKgtpImgar6pmWlUdj26RFVPaaWaTMMUOs8rrCF+KLCXKczQ22qUJWJoSiSvNRoYdO/6ZZ92vKAo1ZUSXLX77tKVBFVK9Xz7ueyYa4nbR51q+NR9Xk+nuqwwdLfG/2wiwvh93rUaxtvVZP/EQK+bVqoyOSjGKUSzKP9WoaHfRx7fFELzbo29v+3rII7/6COehKIhe06kgth+XnZJYiegXfHmy86JStg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K4xi3L0x; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K4xi3L0x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKVm3Jt9z2xFn
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:16 +1000 (AEST)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7a9a30a045cso419780285a.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697853; x=1728302653; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vb+rHfycpw6eqzxAcjL5Q/NM2Cf8FBszS0leZkajSd4=;
        b=K4xi3L0xX9pRb4iGVyHVnH7+qUPWcw4upICmG89sFSaiSErkk9wgSbMhx4vTL3EGii
         +FWqvK4LZBh+Hv6skwvVD6xLSaIjyGn8ixbGMqVMqRO7Zv0xJW47UCfNemmen3/m9Pdh
         cemz1g6tIkOCuU1plL6e0X15GEy48Y2dzV6GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697853; x=1728302653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vb+rHfycpw6eqzxAcjL5Q/NM2Cf8FBszS0leZkajSd4=;
        b=Zt31uc4nEOS/S/9g2+6/SEXJqhmF2ejMavVtDKtlmK0OQSMQZio3JUMEKORQyLt4RS
         JbkI4FD/pVv1rNGIBsJq3mIPE9dVGnr0582URRCD+V5rQLO4Q9S4Oa+9QhCCsh8tuPDq
         M5Y9z5XFzSHojad6+r9jspLTJqoP0KG3O/ZOB8lXi9xgddipPuQaXmReu63WM0MhmRsa
         iAQQwSvSTd8IgQS7gXAY7neRfPP1dorWhBlD0m5zPAQOYMFpuZm4vMMwIkYm1LHop2Rt
         sjFUQLZnY0QRn9buR+JSGMeYPhAtHfEbYsBfzGYDrUsi4vBNAEOdThxQQa7J/kQVwgob
         oXag==
X-Forwarded-Encrypted: i=1; AJvYcCVcla5AYEX0n/8h5MgT0rfeCUqSCBR8iTw3PLezru/Z7M/gTv7Rp2mbOBiLzfK7XDOWQHo3jdZVvJHGNcw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzcndNYXTHgwXMW8AoBS8o7unJu4jyAYqIhhib52oNjd3VKxVoG
	FAcSH07XypvCpCJLGZFePIkSWhPjk90i/yUPwW/AOHcY3zojs7kViuDU/fmaNg==
X-Google-Smtp-Source: AGHT+IERK7kGfru4Q7d82RuyPjgoS6CBbu4N/h9Q+YkCupy/y3EuDtqtjn9iCQgLe1Tq04yD8BYOEQ==
X-Received: by 2002:a05:6214:4a8e:b0:6c5:5418:a055 with SMTP id 6a1803df08f44-6cb3b5f2781mr194666026d6.30.1727697853291;
        Mon, 30 Sep 2024 05:04:13 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:12 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:00 +0000
Subject: [PATCH 05/45] media: pvrusb2:Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-5-81e137456ce0@chromium.org>
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
drivers/media/usb/pvrusb2/pvrusb2-hdw.c:341:11-14: opportunity for str_true_false(val)
drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1727:6-17: opportunity for str_enable_disable(enable_flag)
drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1663:6-14: opportunity for str_on_off(enablefl)
drivers/media/usb/pvrusb2/pvrusb2-encoder.c:265:8-29: opportunity for str_true_false(hdw -> state_encoder_ok)
drivers/media/usb/pvrusb2/pvrusb2-encoder.c:271:9-33: opportunity for str_true_false(hdw -> state_encoder_runok)
drivers/media/usb/pvrusb2/pvrusb2-ctrl.c:524:35-38: opportunity for str_true_false(val)
drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c:475:11-37: opportunity for str_read_write(msgs [ idx ] . flags & I2C_M_RD)
drivers/media/usb/pvrusb2/pvrusb2-debugifc.c:151:4-31: opportunity for str_on_off(pvr2_hdw_get_streaming ( hdw ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/pvrusb2/pvrusb2-ctrl.c     | 2 +-
 drivers/media/usb/pvrusb2/pvrusb2-debugifc.c | 3 ++-
 drivers/media/usb/pvrusb2/pvrusb2-encoder.c  | 5 ++---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c      | 6 +++---
 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c | 3 +--
 5 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
index 8ae3ad80cccb..b6c9bda214c8 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
@@ -521,7 +521,7 @@ int pvr2_ctrl_value_to_sym_internal(struct pvr2_ctrl *cptr,
 		*len = scnprintf(buf,maxlen,"%d",val);
 		ret = 0;
 	} else if (cptr->info->type == pvr2_ctl_bool) {
-		*len = scnprintf(buf,maxlen,"%s",val ? "true" : "false");
+		*len = scnprintf(buf, maxlen, "%s", str_true_false(val));
 		ret = 0;
 	} else if (cptr->info->type == pvr2_ctl_enum) {
 		const char * const *names;
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-debugifc.c b/drivers/media/usb/pvrusb2/pvrusb2-debugifc.c
index 81d711269ab5..9e4eb03133c9 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-debugifc.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-debugifc.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include "pvrusb2-debugifc.h"
 #include "pvrusb2-hdw.h"
 #include "pvrusb2-debug.h"
@@ -148,7 +149,7 @@ int pvr2_debugifc_print_status(struct pvr2_hdw *hdw,
 	bcnt += ccnt; acnt -= ccnt; buf += ccnt;
 
 	ccnt = scnprintf(buf,acnt,"Streaming is %s\n",
-			 pvr2_hdw_get_streaming(hdw) ? "on" : "off");
+			 str_on_off(pvr2_hdw_get_streaming(hdw)));
 	bcnt += ccnt; acnt -= ccnt; buf += ccnt;
 
 
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-encoder.c b/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
index c8102772344b..8a2464744e5b 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
@@ -262,14 +262,13 @@ rdData[0]);
 			pvr2_trace(PVR2_TRACE_STBITS,
 				   "State bit %s <-- %s",
 				   "state_encoder_ok",
-				   (hdw->state_encoder_ok ? "true" : "false"));
+				   str_true_false(hdw->state_encoder_ok));
 			if (hdw->state_encoder_runok) {
 				hdw->state_encoder_runok = 0;
 				pvr2_trace(PVR2_TRACE_STBITS,
 				   "State bit %s <-- %s",
 					   "state_encoder_runok",
-					   (hdw->state_encoder_runok ?
-					    "true" : "false"));
+					   str_true_false(hdw->state_encoder_runok));
 			}
 			pvr2_trace(
 				PVR2_TRACE_ERROR_LEGS,
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 29cc207194b9..761d718478ca 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -338,7 +338,7 @@ static void trace_stbit(const char *name,int val)
 {
 	pvr2_trace(PVR2_TRACE_STBITS,
 		   "State bit %s <-- %s",
-		   name,(val ? "true" : "false"));
+		   name, str_true_false(val));
 }
 
 static int ctrl_channelfreq_get(struct pvr2_ctrl *cptr,int *vp)
@@ -1660,7 +1660,7 @@ static int pvr2_decoder_enable(struct pvr2_hdw *hdw,int enablefl)
 	   anyway, just in case somebody else wants to hear the
 	   command... */
 	pvr2_trace(PVR2_TRACE_CHIPS, "subdev v4l2 stream=%s",
-		   (enablefl ? "on" : "off"));
+		   str_on_off(enablefl));
 	v4l2_device_call_all(&hdw->v4l2_dev, 0, video, s_stream, enablefl);
 	v4l2_device_call_all(&hdw->v4l2_dev, 0, audio, s_stream, enablefl);
 	if (hdw->decoder_client_id) {
@@ -1724,7 +1724,7 @@ int pvr2_hdw_set_streaming(struct pvr2_hdw *hdw,int enable_flag)
 		hdw->state_pipeline_req = enable_flag != 0;
 		pvr2_trace(PVR2_TRACE_START_STOP,
 			   "/*--TRACE_STREAM--*/ %s",
-			   enable_flag ? "enable" : "disable");
+			   str_enable_disable(enable_flag));
 	}
 	pvr2_hdw_state_sched(hdw);
 	LOCK_GIVE(hdw->big_lock);
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c b/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
index 63db04fe12d3..60a0df018334 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c
@@ -472,8 +472,7 @@ static int pvr2_i2c_xfer(struct i2c_adapter *i2c_adap,
 			       idx+1,num,
 			       msgs[idx].addr,
 			       cnt,
-			       (msgs[idx].flags & I2C_M_RD ?
-				"read" : "write"));
+			       str_read_write(msgs[idx].flags & I2C_M_RD));
 			if ((ret > 0) || !(msgs[idx].flags & I2C_M_RD)) {
 				if (cnt > 8) cnt = 8;
 				pr_cont(" [");

-- 
2.46.1.824.gd892dcdcdd-goog

