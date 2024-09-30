Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7B098B03F
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkc05h5z3fts
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c33"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697878;
	cv=none; b=cXOIKf8BOXJeh/WhLyYQUyOH2T0yORQg0yJ2TO2DACKz/k4LAz1C0Zwo1QN+hzuhQgEDUw3j1MjT7C+Tnb096suY+8a58FUCtoRojnzLo3VtUycN/oJRRhtxtvVmyNAWhPIx5CVGnPrAYsiqLDzZ5QdKprN+yaOyKfm7PmiLj9kdgbDg83/d9E/6rAI+XWDRWuXeWyRiPj3zECQ8oiDHV1WiSAaThnAaGCJFcakEeQXNMvqn6lZwcdWxW+iV4ubHvKS1WxEG8PSdY42EpCKUAxMS4xGOWOkOkLA7F6KK5Q0YBP2vw83XRDDe1RE/uyewZie2c4ot4FJjc2qde+Xb2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697878; c=relaxed/relaxed;
	bh=xpVUYLeo0hSTOfKt30J/ldl6oRGhulqCfi0QX1kLeY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPq3HDuz900gDSXW1LFX4XzxPU2owqYGQYUJ4+UVIea0nFZthVhUjnBp+tABYln2jsokia/KWLW0byMDb/eK7k1R/vTJLp3QO+uqkSUQ6pkOZLjioExBtTExLar01zKKjEB+bUqU/Pf5FglJ6bdsVWcp40c54Hkfmq3bqPekIjew7JgcyJmW/Bk3b8QGp1doKpacAdG7aheB6lCHG+3A25F/z3+OnuBeWvOx71Kzh1breTWW63nI7OJbiUNuGhu6OC9D10od0PnQtnK4gBcZSknulk/RlysNza15PMJO/YrhPOnI87PYE8a3bkuIf9m1AMpbPdWyFaMrQP2ax3/U/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fjfDHGqd; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fjfDHGqd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWB31Qsz2yQL
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:38 +1000 (AEST)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5e1b55346c0so1791933eaf.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697875; x=1728302675; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpVUYLeo0hSTOfKt30J/ldl6oRGhulqCfi0QX1kLeY0=;
        b=fjfDHGqdWZcgDnmlqGhFlvJnzUg5zpxQMO+ohJ6px3A/0jx1coCGAgdVIT4ghvmAmJ
         Tw/Gb+1CI5jQ2t03TK2Yxlq+K0ifUCMsMxq/ot1VJ3IcmCOCnG2VnbFc7KwDwvHioIxc
         QuxtdGO6393nkGH2pROF5z/gxLF4XaU6iVQ3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697875; x=1728302675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpVUYLeo0hSTOfKt30J/ldl6oRGhulqCfi0QX1kLeY0=;
        b=LGwF3aFDjM88CYvLsyH2mmPL/0AF93KQtbx+bMUA9yf8Hx2BLSKTR4mI39H+EqCeZn
         TjaSJQ3CmnGqfJpG0baIGPAcGopuhMsXihtm/Lc11ntq0XR/yaFPLJRetd5ht5cDQgE0
         qG72zRulr3HHWIXMueLmLLod70ENjwJSIBAYdd7Yj68jWg2/eMACky/Vp57R7CCULbxb
         4qLz6/Vdvab5mTHcE4mBpDj2kzaG3zj8SF+BBM/STgRuq7i6mvQzzMZB2Iu2V/METB2B
         LVzFk5ghEI87/yMsoBtgzSNsAsVlwMB9XgXMRDQJIdAZ7FSVp7QYRA8V+WhgNokPtrkx
         4ncA==
X-Forwarded-Encrypted: i=1; AJvYcCW/mbYd8GhOKeMhhQ0sgC3iMSshX8rtt4PF5pc06shN5m8QyFkuOK0byLBcx1rgOXRy5n8oQnlvQ0qdNSw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzOP8XxLK7HNQqaSVfIf1P0NqwpKBlIuoMw/teIj89KtXdEY1UU
	wFRYVVyrkAcbD8nqwC8X6pJWSIwM8jYEupvM0QVxG0XFAto3L8x3yE84aRQt9w==
X-Google-Smtp-Source: AGHT+IGd3K8vbb6GyQdRKaZnKoS5TA6gIcUfCdqxCm9K5gJfl06dGrwyNT5yGfSWCEUO0kuvQMkCfQ==
X-Received: by 2002:a05:6358:e4a9:b0:1b5:968f:e221 with SMTP id e5c5f4694b2df-1becbb39bb4mr326693155d.2.1727697875191;
        Mon, 30 Sep 2024 05:04:35 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:10 +0000
Subject: [PATCH 15/45] media: amphion: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-15-81e137456ce0@chromium.org>
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
drivers/media/platform/amphion/venc.c:1206:4-26: opportunity for str_enable_disable(venc -> params . rc_enable)
drivers/media/platform/amphion/vpu_dbg.c:259:3-34: opportunity for str_on_off(vpu_iface_get_power_state ( core ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/amphion/venc.c    | 2 +-
 drivers/media/platform/amphion/vpu_dbg.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
index 351b4edc8742..789c8fca3d31 100644
--- a/drivers/media/platform/amphion/venc.c
+++ b/drivers/media/platform/amphion/venc.c
@@ -1203,7 +1203,7 @@ static int venc_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i
 		break;
 	case 8:
 		num = scnprintf(str, size, "rc: %s, mode = %d, bitrate = %d(%d), qp = %d\n",
-				venc->params.rc_enable ? "enable" : "disable",
+				str_enable_disable(venc->params.rc_enable),
 				venc->params.rc_mode,
 				venc->params.bitrate,
 				venc->params.bitrate_max,
diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
index 940e5bda5fa3..2dbcef4e83ef 100644
--- a/drivers/media/platform/amphion/vpu_dbg.c
+++ b/drivers/media/platform/amphion/vpu_dbg.c
@@ -256,7 +256,7 @@ static int vpu_dbg_core(struct seq_file *s, void *data)
 		return 0;
 
 	num = scnprintf(str, sizeof(str), "power %s\n",
-			vpu_iface_get_power_state(core) ? "on" : "off");
+			str_on_off(vpu_iface_get_power_state(core)));
 	if (seq_write(s, str, num))
 		return 0;
 	num = scnprintf(str, sizeof(str), "state = %d\n", core->state);

-- 
2.46.1.824.gd892dcdcdd-goog

