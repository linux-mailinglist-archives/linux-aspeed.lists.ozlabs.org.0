Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B089D98B033
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkW6T7gz3fTJ
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::836"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697852;
	cv=none; b=YuH2eDlaS7ItHU5G+gaxKkr5qKXubK2ztRhFkxObeDxEketSLH6bXTtI3slOPCgqChVbGzhbqp6++CC8M7gWR0QSbfJMj+EWHOwoFEiSLma1gJrL6Rb/BaN40blWb8EuGtMH1H1FfM9unFSa6IA2r9yYKEggQuaFVCpoNnBONWNUBjP26buXQgwwjNfyLh+yJkY4RzwSbWiXb0tjxzrGbdHxpuSmmbKkudhC+SpSdKVLnLSPWueSaNb9oGAC9XxEMLLl9DFqaDP/CmsKsXO3JnR+0I8hs7whI6x8h24bZYjcIo2eQvf0KsyK9m/ClKFFF3M9XGYc1hX3HZyH/0rbgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697852; c=relaxed/relaxed;
	bh=4cqERgoR9OlhV9bZcAYTWgDv58ZKeW9/q+4TIB0lCLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZP3cKQ2j4Hb5ym5FRS/dtIXsA/1Y96RLuPCtbtx2cLzYApICpiZi66szOeVNPfnFupo/cFllnACiqwhuVXZpK3600F4BHamyCINwKVuBod+w8PmEhowjcJC0CdNoT8wRbOT+HHym1r6ztQBZS3HnpaqIsJB9V6K7OS6Nn+msK4ToQhXqqZI6evbghPuIJ5o7mbxAUoK7bigazP/GwAd6ZwHvdorISohScG0eHkmsuJFsptt3xqH1JPgUW9TBikwGYP/1SCA/TDq9Zz9BisZMZFyLnbqpRKjXFeasT7q4bch0EvcG//YC9Qt86ptUpDQrZM3YR0uX7JlI7AZ9vurQrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DbVnFGMq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DbVnFGMq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKVh400mz2yNv
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:12 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4581ec0e00eso34629961cf.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697849; x=1728302649; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cqERgoR9OlhV9bZcAYTWgDv58ZKeW9/q+4TIB0lCLc=;
        b=DbVnFGMqLzSSqsvY9deR1s5L+rYgUyN+RWsaHT5wFwyfIS8wzrHnj7JWohHOrbfu/D
         gWVBLrNJJsnchrj3P2FTZ6QH1c7GVqhbUjmlJe8Cnmmz3WIsbVm5LngHF44bmzDWCGHE
         UvhvTjOaNPLQfvryOA2KpdsBHZQrYJQq1Zx0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697849; x=1728302649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cqERgoR9OlhV9bZcAYTWgDv58ZKeW9/q+4TIB0lCLc=;
        b=siL8GCbHTwPV2GmIlM6SKbMxwA9lSJt+Ee/V5mCRtTYl3VJP6kfVKnrjITD0Po7MDQ
         5TC5C8XbkIqO1ppEoYGWEjFAIXSkX9KSSK507Q0wfyX1DXglIDMaY/Ir1Kl0RPxI1o97
         DzznKjiH1tlD5d5RVSYn4yyYEOIjXOZ3fAUMGMsuLW2xzBmY+ddhODhLqgrRwJYzKkrx
         aJqpCVgA1i4HpyYi8Y6aNqVUvPiobr5hlNuLwjyyFq57L2ducDP13AQxFUlqjtbetOSc
         AtI7FNfiOWGXqr3GYea/Xi/SVXKDU4dkOwWYvDqGkO4UCNP5SdvRgoNKkgNqKdBUK4i9
         jM1g==
X-Forwarded-Encrypted: i=1; AJvYcCWFeQGj7FoichIhGGn+by/oxSI9WRPT0pdiIRZkeF+2ScfBx0+S24zgoAnbBw39PjM8ueHqs4oB2YugVFs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzYbXe3+8v/LRH+pKOtkv22mWsRQvLThtsu/+OznXqMzWCFV8b+
	lU/9z/a+/cA8NOqQqobujRwqSTt+Kb+3sdmKAJ5ot2/zSvMaeDWXw5c10lxlbg==
X-Google-Smtp-Source: AGHT+IGdCSwCLQh27OqCiMv81An8yCyEXTlCQao91e2evQ6yJY9lhvUOeYdfvxJFC6O2qm9bRDYGaQ==
X-Received: by 2002:a05:6214:5247:b0:6c5:166e:566c with SMTP id 6a1803df08f44-6cb3b5f06c1mr193464746d6.28.1727697848951;
        Mon, 30 Sep 2024 05:04:08 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:03:58 +0000
Subject: [PATCH 03/45] media: core: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-3-81e137456ce0@chromium.org>
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
drivers/media/v4l2-core/v4l2-fwnode.c:282:32-33: opportunity for str_high_low(v)
drivers/media/v4l2-core/v4l2-fwnode.c:290:32-33: opportunity for str_high_low(v)
drivers/media/v4l2-core/v4l2-fwnode.c:298:37-38: opportunity for str_high_low(v)
drivers/media/v4l2-core/v4l2-fwnode.c:329:31-32: opportunity for str_high_low(v)
drivers/media/v4l2-core/v4l2-fwnode.c:356:40-41: opportunity for str_high_low(v)
drivers/media/v4l2-core/v4l2-fwnode.c:364:38-39: opportunity for str_high_low(v)
drivers/media/v4l2-core/v4l2-ctrls-core.c:272:16-26: opportunity for str_true_false(* ptr . p_s32)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c |  3 ++-
 drivers/media/v4l2-core/v4l2-fwnode.c     | 12 ++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index eeab6a5eb7ba..f303c70dffae 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -8,6 +8,7 @@
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
@@ -269,7 +270,7 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 		pr_cont("%d", *ptr.p_s32);
 		break;
 	case V4L2_CTRL_TYPE_BOOLEAN:
-		pr_cont("%s", *ptr.p_s32 ? "true" : "false");
+		pr_cont("%s", str_true_false(*ptr.p_s32));
 		break;
 	case V4L2_CTRL_TYPE_MENU:
 		pr_cont("%s", ctrl->qmenu[*ptr.p_s32]);
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index f19c8adf2c61..92dc17179018 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -279,7 +279,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_HSYNC_ACTIVE_LOW);
 		flags |= v ? V4L2_MBUS_HSYNC_ACTIVE_HIGH :
 			V4L2_MBUS_HSYNC_ACTIVE_LOW;
-		pr_debug("hsync-active %s\n", v ? "high" : "low");
+		pr_debug("hsync-active %s\n", str_high_low(v));
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "vsync-active", &v)) {
@@ -287,7 +287,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_VSYNC_ACTIVE_LOW);
 		flags |= v ? V4L2_MBUS_VSYNC_ACTIVE_HIGH :
 			V4L2_MBUS_VSYNC_ACTIVE_LOW;
-		pr_debug("vsync-active %s\n", v ? "high" : "low");
+		pr_debug("vsync-active %s\n", str_high_low(v));
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "field-even-active", &v)) {
@@ -295,7 +295,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_FIELD_EVEN_LOW);
 		flags |= v ? V4L2_MBUS_FIELD_EVEN_HIGH :
 			V4L2_MBUS_FIELD_EVEN_LOW;
-		pr_debug("field-even-active %s\n", v ? "high" : "low");
+		pr_debug("field-even-active %s\n", str_high_low(v));
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "pclk-sample", &v)) {
@@ -326,7 +326,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_DATA_ACTIVE_LOW);
 		flags |= v ? V4L2_MBUS_DATA_ACTIVE_HIGH :
 			V4L2_MBUS_DATA_ACTIVE_LOW;
-		pr_debug("data-active %s\n", v ? "high" : "low");
+		pr_debug("data-active %s\n", str_high_low(v));
 	}
 
 	if (fwnode_property_present(fwnode, "slave-mode")) {
@@ -353,7 +353,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_VIDEO_SOG_ACTIVE_LOW);
 		flags |= v ? V4L2_MBUS_VIDEO_SOG_ACTIVE_HIGH :
 			V4L2_MBUS_VIDEO_SOG_ACTIVE_LOW;
-		pr_debug("sync-on-green-active %s\n", v ? "high" : "low");
+		pr_debug("sync-on-green-active %s\n", str_high_low(v));
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "data-enable-active", &v)) {
@@ -361,7 +361,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_DATA_ENABLE_LOW);
 		flags |= v ? V4L2_MBUS_DATA_ENABLE_HIGH :
 			V4L2_MBUS_DATA_ENABLE_LOW;
-		pr_debug("data-enable-active %s\n", v ? "high" : "low");
+		pr_debug("data-enable-active %s\n", str_high_low(v));
 	}
 
 	switch (bus_type) {

-- 
2.46.1.824.gd892dcdcdd-goog

