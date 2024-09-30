Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB32C98B058
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:46:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkn0vHNz3gGw
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c34"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697926;
	cv=none; b=eKU4Gou3fXp5Zb3Lhmuwa/X+8uxEA7XfYEo+Kyd0crJ9/KohbKzmA6htfy5t+LzC56rhHEpcjbzD3WPXDkWNqRtRpvZW+8v2EBjIUo0dAeI0BuZNmhoS8neb2QsZOAtqPaXkL+D/4TnMJEUhGouGwyDjgz3T8e/6HyDDyuLTGrO1co4oAO6+J7xBq2a+/wMQuPji7riXJ5ERKbY4CFeuXbg386a0iCpg2pkNnvq0BTVe4BPqmORBofL5fYKCv2tnXwioyIeqp57n1/OpoR6an4tctTxRTJm+a6+VT4h8tsWzJvCOoe2WDUg2uZ7WpsVhF90Ycokq8uHWg8VMiH/HdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697926; c=relaxed/relaxed;
	bh=dipHc0aYdmEBdS77HCaW8bxKOJhKMvnfR/ECPy5ogKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lAsnLcDxShOoUFmWFP/ktungd121SnaMP/BNwr2hc0TuFG6UAURMirdQYODYDEs7oVJGgiJj2MwfP0LQcWc0EDJu1H7RPz81CfKKEvVzMGmHOCg94OjLGzVhBlszxc+Qf8n+7u3hsQSkSDyMLHQof9Cma+LsnTH0oVXBzg/E5mTZSN3PRNEPvpHNL0JhCCTMv2nHdAudxfuR8Ru1AxBLNoXrgYdwOl/Qp5G1w2vlk4tP0EQVfnPqLYCr2jijj6q1yKtYw3yNsoXohxqL70tkRoIN5zGAOGlAXsQJlwutRevJgeNQisQrWS0ArbNwCBUmc2iDgkPd5YgFwLm8ynDUyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L3n7x5kz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L3n7x5kz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKX64RPyz2yvv
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:26 +1000 (AEST)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5e5568f1baaso2414679eaf.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697923; x=1728302723; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dipHc0aYdmEBdS77HCaW8bxKOJhKMvnfR/ECPy5ogKA=;
        b=L3n7x5kzWTN/S9ayebbaJn0I97TVcW1EUlN8riceAz6NgguycYwUfj03PFhfeyBCw7
         YhVlLsjXCQCsFUq4SKW6dT3YD7X9JhpkZRfnBiKJDrglP0aNhMOKXaVzqTwxtEb11o1U
         x6EysRM23g+knpdIapavq0o3Tey8jsRzUP/MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697923; x=1728302723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dipHc0aYdmEBdS77HCaW8bxKOJhKMvnfR/ECPy5ogKA=;
        b=VqDM3bbriFlNljsYfd4M08kJZaNdBG4+vdUudqP6sDmXlJyOG16kbPoi7tx1qlaqiL
         hLm+Tk5LdpzzGLud3ho6ydnrsyiXT5Pqt7GAioZwT/yVpp2HnhbBI1/2pogLDeeE6qzs
         bAOd6kLxAPMLl9n8/d05CJZwnE4u+RSHGoMsmA8KY2oPVB7UekNR3A6TOLb1brp2Sijz
         YulKtAwPIA4fivfuuaHdogmfAywgc6J7ke8ntoGpw3A+OmdwQQODd3Xp5Q7usBhFBVlL
         oNBUL6WDwRAMgbvdUCcjzg6LBolP4oaJmZze4WlyPXfFzTGHzowOoiBxu/BTTAtozBIz
         q2UQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3TgBYXGWpWUARePvTj0srUQq4gBN4g28gQE5NuBtZn5MM7ojRd53L72Ea6NuZQAvCIzZiPVfHYyFT0mk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx27SHkybG+mApN06/m0H19IAWTAYtbYlmYLXmItpP1zj0RxbAT
	gH6pHw2V6jrgYFpwWpy0fWQP/v5GIb9jXN3BD4zJ0JwhzjCW45/0Z8uUFLhJ1A==
X-Google-Smtp-Source: AGHT+IFoOt4rzgvhDCZteDnFFmUKzF/AVrjX9ESZ9nyOoTWl+oHTKxHAU5l+hHb9VoTek5XVl6j96w==
X-Received: by 2002:a05:6358:784:b0:1b1:ac7f:51d5 with SMTP id e5c5f4694b2df-1becbd0145emr538282555d.22.1727697923522;
        Mon, 30 Sep 2024 05:05:23 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:23 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:36 +0000
Subject: [PATCH 41/45] media: i2c: saa7115: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-41-81e137456ce0@chromium.org>
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
drivers/media/i2c/saa7115.c:1366:3-9: opportunity for str_enable_disable(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/saa7115.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index a1c71187e773..ff0931cf5ecf 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1363,7 +1363,7 @@ static int saa711x_s_stream(struct v4l2_subdev *sd, int enable)
 	struct saa711x_state *state = to_state(sd);
 
 	v4l2_dbg(1, debug, sd, "%s output\n",
-			enable ? "enable" : "disable");
+			str_enable_disable(enable));
 
 	if (state->enable == enable)
 		return 0;

-- 
2.46.1.824.gd892dcdcdd-goog

