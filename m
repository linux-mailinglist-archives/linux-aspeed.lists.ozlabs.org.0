Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 617BF98B057
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:46:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkm5lJ3z3gGK
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697924;
	cv=none; b=KGytDJi0Vf5f+jMnTsIyln6wFdx6D6l/o62B2aoBOvTgiszGMoLBimOR6LmA0bswqIPEvZcU1OQ/q0MFq+RciQD4XrQufRZ2+DhKtAUT+03KIR5APpcmxDmnw0Aip9scFSVdRHCZKwR7FwhPvr2c7eTfSqjab//mX2Tq0fUMexayUQ+ivk2JviCQzGW9iG2xXW0YnatqZdF77nU9IqzIzcxHcAh9SDYeahN2ExTUTkNgGo9Qg/nHX9f/fWCOgjcAWjRtwFD6N0Xo7t841b7IldElVoJmXrp57uiw25fNbqHrUGTBcO9kXXL5K//kccZuD1Z8uEqTH1vhrcyVzrYhIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697924; c=relaxed/relaxed;
	bh=JU7U+YsXwNUN3GXi+lZlabPGhAkg1lZuiKZFCmpVa4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KkJBPFq+FGwo+eL+Oc26W3RXCZRrdCQTPMcrMo7oNx5GFAEJhx7uawUYbX9PXo3Dcgvh/zvqKGbs/foOm8qz+e0+vV+5MXzUhpbuuKq0WNAC6+xCh1DBVi+6XBBcJSnzEuPhEPttc5SKPIC2yyBKlwMlPVt6mFyxZ/NL61EFMR2nU2xpX/762EgpR9UB5/BogIgjk1NP5FNDm51MB1++CHPDAQbtdfZ+/sLjKQCQJoGxJa0pmHHyeFOLJBZIXMTZXZAlmH/GwPvO0VFc/MwHzMCnoRgnnZ0/nfwnBuyvmzntAwSw3pUK2AOqr/O6kJuFJ5W9tVhdSqQVtzFXw5QdzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c47j/emr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2d; helo=mail-qv1-xf2d.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c47j/emr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f2d; helo=mail-qv1-xf2d.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKX34V4qz2yps
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:23 +1000 (AEST)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6cb35f2aec1so29792696d6.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697921; x=1728302721; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JU7U+YsXwNUN3GXi+lZlabPGhAkg1lZuiKZFCmpVa4Q=;
        b=c47j/emrqpMA+umtfs14VVEQZyz4Q6cfsQxwbUQ+KE0jDJ+I032WSZIAka+tLf5ach
         QsCRMsewTu/Bl8gkPuMyxwcwaN83W4QtIRidXcX9+HNVKhZeqaYR/qzeMSSVUFAZjtMU
         Tc+uSll4sAGMRFyMm2zFBmTm6ESkqXJw0VZwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697921; x=1728302721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JU7U+YsXwNUN3GXi+lZlabPGhAkg1lZuiKZFCmpVa4Q=;
        b=V7RBt8UKD8W84y7yYgGmSGtHCrlf01QK5Meb9bGZZGViya1S7vq0GFOPMqp0u4glrA
         Q9VrT7lV9tJE5e6Kz5d9zZY3fu09hy+jFobOk++cpZpDqCMAn+qjwAIrDMTQnfbICxao
         xJh5V0pq4R7tk8B/DDzR5aPX7aij7/aKpmElTLUaAiqegiumWpvWP3R6lkIt3scpsHWm
         eD4wo8DL6Msosl1fC9tQ6jkucyMBApJiA/VEudJ2857Lqf/JRgj5lY7mhKWhH2IlPZcx
         ZL8B8P8xq2x/Tulq8yWAa1D8DjFHwPGwGnAw9vFBNhp9gTUxzcLdkyEi6xlUe4ecAunF
         NRBg==
X-Forwarded-Encrypted: i=1; AJvYcCVQYVmMiPTkC+OK2Kz/f+wSXkYxcCCLU/gclqYp2qSujl6vBinMHttok6VEXh596kQstfbvZFrtQm8u7GA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwOByGHGb7yKxt5NFWx+MxSs8ovgGnzD7dTVcwVX4NCN+1mymT3
	nKWMjtc384TAfI4KulpsRdtG7ATSNPnmPmx/zrDoKeOyLS26FZOyurEzwz5qsQ==
X-Google-Smtp-Source: AGHT+IFo7OOUc+eOD+KctwzfWQcOtVnWKBIl/eyXC/k7ALK2/LWIOZekEy/aM6hhFvO+98exx2mm7Q==
X-Received: by 2002:a05:6214:310a:b0:6cb:52c9:b91e with SMTP id 6a1803df08f44-6cb52c9bbcbmr87563466d6.35.1727697921599;
        Mon, 30 Sep 2024 05:05:21 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:21 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:35 +0000
Subject: [PATCH 40/45] media: i2c: saa7127: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-40-81e137456ce0@chromium.org>
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
drivers/media/i2c/saa7127.c:678:33-49: opportunity for str_enabled_disabled(state -> cc_enable)
drivers/media/i2c/saa7127.c:677:33-50: opportunity for str_enabled_disabled(state -> vps_enable)
drivers/media/i2c/saa7127.c:379:19-25: opportunity for str_on_off(enable)
drivers/media/i2c/saa7127.c:346:49-55: opportunity for str_on_off(enable)
drivers/media/i2c/saa7127.c:430:42-48: opportunity for str_on_off(enable)
drivers/media/i2c/saa7127.c:405:42-48: opportunity for str_on_off(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/saa7127.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/saa7127.c b/drivers/media/i2c/saa7127.c
index 818ed19cf37b..1ea5e4b9019d 100644
--- a/drivers/media/i2c/saa7127.c
+++ b/drivers/media/i2c/saa7127.c
@@ -343,7 +343,8 @@ static int saa7127_set_vps(struct v4l2_subdev *sd, const struct v4l2_sliced_vbi_
 	if (enable && (data->field != 0 || data->line != 16))
 		return -EINVAL;
 	if (state->vps_enable != enable) {
-		v4l2_dbg(1, debug, sd, "Turn VPS Signal %s\n", enable ? "on" : "off");
+		v4l2_dbg(1, debug, sd, "Turn VPS Signal %s\n",
+			 str_on_off(enable));
 		saa7127_write(sd, 0x54, enable << 7);
 		state->vps_enable = enable;
 	}
@@ -376,7 +377,7 @@ static int saa7127_set_cc(struct v4l2_subdev *sd, const struct v4l2_sliced_vbi_d
 		return -EINVAL;
 	if (state->cc_enable != enable) {
 		v4l2_dbg(1, debug, sd,
-			"Turn CC %s\n", enable ? "on" : "off");
+			"Turn CC %s\n", str_on_off(enable));
 		saa7127_write(sd, SAA7127_REG_CLOSED_CAPTION,
 			(state->xds_enable << 7) | (enable << 6) | 0x11);
 		state->cc_enable = enable;
@@ -402,7 +403,7 @@ static int saa7127_set_xds(struct v4l2_subdev *sd, const struct v4l2_sliced_vbi_
 	if (enable && (data->field != 1 || data->line != 21))
 		return -EINVAL;
 	if (state->xds_enable != enable) {
-		v4l2_dbg(1, debug, sd, "Turn XDS %s\n", enable ? "on" : "off");
+		v4l2_dbg(1, debug, sd, "Turn XDS %s\n", str_on_off(enable));
 		saa7127_write(sd, SAA7127_REG_CLOSED_CAPTION,
 				(enable << 7) | (state->cc_enable << 6) | 0x11);
 		state->xds_enable = enable;
@@ -427,7 +428,7 @@ static int saa7127_set_wss(struct v4l2_subdev *sd, const struct v4l2_sliced_vbi_
 	if (enable && (data->field != 0 || data->line != 23))
 		return -EINVAL;
 	if (state->wss_enable != enable) {
-		v4l2_dbg(1, debug, sd, "Turn WSS %s\n", enable ? "on" : "off");
+		v4l2_dbg(1, debug, sd, "Turn WSS %s\n", str_on_off(enable));
 		saa7127_write(sd, 0x27, enable << 7);
 		state->wss_enable = enable;
 	}
@@ -674,8 +675,10 @@ static int saa7127_log_status(struct v4l2_subdev *sd)
 			output_strs[state->output_type] : "disabled");
 	v4l2_info(sd, "WSS:      %s\n", state->wss_enable ?
 			wss_strs[state->wss_mode] : "disabled");
-	v4l2_info(sd, "VPS:      %s\n", state->vps_enable ? "enabled" : "disabled");
-	v4l2_info(sd, "CC:       %s\n", state->cc_enable ? "enabled" : "disabled");
+	v4l2_info(sd, "VPS:      %s\n",
+		  str_enabled_disabled(state->vps_enable));
+	v4l2_info(sd, "CC:       %s\n",
+		  str_enabled_disabled(state->cc_enable));
 	return 0;
 }
 

-- 
2.46.1.824.gd892dcdcdd-goog

