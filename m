Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAF998B044
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkd6MYzz3fyY
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697888;
	cv=none; b=IxLt3ePFcufXS/WDziLZE7nWJT7cTHgSbsrI6w+eIzLDpcVGWFZVzXoEkoQlu2TIkojJunszsTy0vHBrPudqY6j+fP6BWQx0pfqDGdutw/XdlWl5fyPQj/h9jINO4+fsL48fgmlBJdSUOSNmBigHGlKK5iuhbErL/sdEhmjqtncNe7gVqgQfxzp4Kqq+F+BnGkQEEi6KIJfNdc5nurMSlSqDLbWqA2jp0f17/6q1v68VjsO6cqXTba1jYobUGqc9ZYzXom2tU+L6DC1qR1SfGRuIYZ4x7Khumb4cu60ochMTEic3thc+bwkCQpDGimW1U3kqlGVr9Yn8RwGOg2PsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697888; c=relaxed/relaxed;
	bh=h0yeJPaEcAnmgbtIHCIKdElv7f1NVvyLMutp/xQYAjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWMhijvCeYOc2yfY0vqhoyPn7gYcrOa59ubhXa6yAMMT1zRcqu7mjy39H0ZY1U3AtbLAAiwqV1OvGR0Af2bfHv72+JmH3O/B85a/2YAV+le0tPDWmjP9i0hO7h8RHA3anS8+njs+1WfnJekcByUmo4SUC09ZtwXV3LoJQ5Y8OD4RSV5wWJoduKs2yTOWTmndvXQkIHAIW6gar5Yu2UWs7MwIT2npx8CcR3CLL9rYEn0PXIRnt64uCQ4nQ5fr1LfXXcwfTpA0P6LVUuin5Qviq0RDqe097jseqU4dC56YBy1o1B1n+FzUXwPMxU42vpq4AbvE90+L5AUio48IimWidg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FK45gqf6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FK45gqf6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWM6P6Jz2yXd
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:47 +1000 (AEST)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6cb29ff33c5so40591816d6.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697886; x=1728302686; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0yeJPaEcAnmgbtIHCIKdElv7f1NVvyLMutp/xQYAjQ=;
        b=FK45gqf6URp4n/JgDH4BZb95gK5HWEp78DoOyuO1ppXH/Rf4I9MBknNmjw6yXimx8U
         bUzbVe5Tm8C8CCf7k6baIoZwhBTmTWKl5aTQK09PcNyft9v/umHMBwlO1KXkyWFiYFnN
         0eHwFUdlYXF//C7KemtL5pYudBM/qFBBuPWeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697886; x=1728302686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0yeJPaEcAnmgbtIHCIKdElv7f1NVvyLMutp/xQYAjQ=;
        b=mOM+1GTneTGTcZeD6uvi9Qu9Lp8SvKAeN0zPKGe9nG7xZ5NCckNzPiNgJkxUqswdub
         7AOLLCr0D8/Co9ppcuMgeOG0JLzqhQzfj3oROs6IDrog7tNk500Pq+AoN07ppCbySrAW
         v4Hj5XHI8Sjt44KM8111MRm9TkyIldHcOul402N/Os3f6lulk8lc+OnqXXjepDozW4ko
         dxoFpQpiGB+S5tnXo+O5AJEWocsWTgZzhkEAprYuQk8rIgBnOo+CWjNS7PCO7PnducxH
         GNoHoWGTN7PgS175KUfL/ClsCFtmsJ0kbhoYMtepCO41Zag7U/Cu9SUqFnCajecfeg7F
         eD1g==
X-Forwarded-Encrypted: i=1; AJvYcCXyI2huSsMyTsyQMDkFyGJOT1QuDuGpehOwC2cLn2c/sPT2YiYo6iJvDggkq+pL+QO4iC0JCIW7mQfS0QA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzoMn0GiphBvskqc1wa7k5GTwIPfchVuNs3FW20y7pljTjylivD
	EiwEdVICoLDK9t/xkl/jq84ZDvIo8r8/RkSGSWoCcSKYpxTQmS9o1YjA275Yrw==
X-Google-Smtp-Source: AGHT+IG21mP+tUHPXSvJJJTKpKcZKw04O9Ig9Voo1lmCCA0A43eFT06NNMj2BNffGbxEca0hhvGjiw==
X-Received: by 2002:a05:6214:3a88:b0:6c5:b636:d737 with SMTP id 6a1803df08f44-6cb3b5b648amr195767466d6.2.1727697885829;
        Mon, 30 Sep 2024 05:04:45 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:15 +0000
Subject: [PATCH 20/45] media: st: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-20-81e137456ce0@chromium.org>
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
drivers/media/platform/st/sti/hva/hva-debugfs.c:74:9-22: opportunity for str_true_false(ctrls -> dct8x8)
drivers/media/platform/st/sti/hva/hva-debugfs.c:79:9-22: opportunity for str_true_false(ctrls -> sei_fp)
drivers/media/platform/st/sti/hva/hva-debugfs.c:77:9-23: opportunity for str_true_false(ctrls -> vui_sar)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/st/sti/hva/hva-debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/st/sti/hva/hva-debugfs.c b/drivers/media/platform/st/sti/hva/hva-debugfs.c
index a86a07b6fbc7..5e8c7dddbabf 100644
--- a/drivers/media/platform/st/sti/hva/hva-debugfs.c
+++ b/drivers/media/platform/st/sti/hva/hva-debugfs.c
@@ -71,12 +71,12 @@ static void format_ctx(struct seq_file *s, struct hva_ctx *ctx)
 			      "  | |- SEI frame packing type=%s\n",
 			      v4l2_ctrl_get_menu(entropy)[ctrls->entropy_mode],
 			      ctrls->cpb_size,
-			      ctrls->dct8x8 ? "true" : "false",
+			      str_true_false(ctrls->dct8x8),
 			      ctrls->qpmin,
 			      ctrls->qpmax,
-			      ctrls->vui_sar ? "true" : "false",
+			      str_true_false(ctrls->vui_sar),
 			      v4l2_ctrl_get_menu(vui_sar)[ctrls->vui_sar_idc],
-			      ctrls->sei_fp ? "true" : "false",
+			      str_true_false(ctrls->sei_fp),
 			      v4l2_ctrl_get_menu(sei_fp)[ctrls->sei_fp_type]);
 	}
 

-- 
2.46.1.824.gd892dcdcdd-goog

