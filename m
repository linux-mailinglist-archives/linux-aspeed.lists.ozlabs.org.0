Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB6B98B056
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:46:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkm3nzFz3gFX
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697922;
	cv=none; b=WQiMaVm4ox5S6hBna627CwjZX22tlVsxtECmqD5F3yO9vffV3ZHQqewIfQicDC9Gi84liShgKn7dp/3de3rBXXCbH/AyaeT3pdbDQ1mhB27k8gvttc8a8w2X8ZagGJipf8azmwlSWC9XKRAuw0gr8FJHV2QncXEW2PfRnjwKCZyA8DxOwbpxV/oZMjUPLcuy0lf3Xnqs/ouTmhMgtJLi6nM4TtqU/j8NFTRkvjTG9YkhdHoeYqmRjqd0lXrwtQJI/hLXzdkJCcQ36JwNBJu7jt6A5Q3bdL2AteUN2JLqEEOLVUabrjLVxUzcbhfmWm4e1BcAcoD3J5Z/rYZQI4Htpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697922; c=relaxed/relaxed;
	bh=ckz+f9oQpPUu6rIcK1E7/sklc7IJmpymEtGmVuUIyqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SrP/DjAoPeM/2EhsYNLTkfzJHo/WAWkGazJ1AdRmIpozl4IlqQ7SETo8tv/QFHAsestp09cnAfKS6/EOSiv5vZTW54aorrkg+XcBtusXft787zd7i3IjUEKarNnq3WcRnpTU8B2stG4faMj9pL03Fui7vlR543DXGXwdA1bCXJ+oVnVI5+q68uW4Ox/n1A5xbAme0KRveQoWKOhyfFfSIhb3h2b7yUwJ4Z8gdHve+VXbRwnRJyHjrg7IG952ysD62YgJ8mABHDljGelzt7dFo8PaRy7X6fiO5WxafsnDyQzHQcLxd6PdShu2A/e17gURuyZlUpSG80Sf9S6pDCiSNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MOimXTgN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MOimXTgN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKX239lcz2ysv
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:22 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7a9ac0092d9so492793585a.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697920; x=1728302720; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckz+f9oQpPUu6rIcK1E7/sklc7IJmpymEtGmVuUIyqc=;
        b=MOimXTgN7eJdlVJi8R6QR/X+wAfcb2q4zTlKcfUJVFyjUWni1b4m0zvfVdkwK1qt4c
         rS/s8/Z79H+0jpqCfFKVIQG3wuZ56/RDHB8zH0OTh5pKSpgL6Q5dW/Sm4749FeRHDqMF
         cvbje8h/ggOdeTnAqdB5JjqWfmPpERkx1bIQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697920; x=1728302720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckz+f9oQpPUu6rIcK1E7/sklc7IJmpymEtGmVuUIyqc=;
        b=Cf4u3VHhJZV+/e4BJvPoPJBpUQt52KYClsZQflsYvIWOhJgxmw3E+wg7uxcJpHLVzt
         bTNp5PKVIUJahqGWQnSfts5JB+JQHk6vF685mP11SMDXQTjgEf+6/C7TWoWVTApa9ugP
         gKKM8ZeTZiRWej6xD8IH/DHmcnceKdige9Xjy5pWPE9a/mQDqR4sQ/r8pq5iFhlyXTAt
         x1ybhEJyTU8YwOd9/KHXcVkhEGa4b649kDmkUiyL6nq1zXln5qJLx160pEq55f5lJbeU
         cfz/C2Fg8/NHO6kc1dC+rW2e4eyW8r9LmXS+ULcBlvDkm5E/g9XgWM8ZHWX8XQDiQWsj
         Vd0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHq9TDMQTWFlRCLcXnHnYh0yjsHCBLz347cjPpR6K6gFajBgoTOIs9+plk5VnLmiPwHxxFEyEIGghVYxU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzKwUJZ3rANe1OArBfL/CNhFSh9a6qhlHr+qbKEtcEt9cFMVftL
	UP4CdXftTnKqyrIFz1w1DA7gulx6zHswhg2QM/tcWe2sIOlEyyRvAI0Z8K7kSg==
X-Google-Smtp-Source: AGHT+IEi2P8ci2OPbo+jpkaZ22WOo6DK57pM4gbAU29+4tgFAAJdQKDCxefcZ9fdV8Kube5E0H3gmQ==
X-Received: by 2002:a05:6214:3a8c:b0:6c3:5c75:d2bc with SMTP id 6a1803df08f44-6cb3b66fab3mr198718286d6.47.1727697920467;
        Mon, 30 Sep 2024 05:05:20 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:19 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:34 +0000
Subject: [PATCH 39/45] media: i2c: saa717x: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-39-81e137456ce0@chromium.org>
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
drivers/media/i2c/saa717x.c:1091:3-9: opportunity for str_enable_disable(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/saa717x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/saa717x.c b/drivers/media/i2c/saa717x.c
index b0793bb0c02a..2337cef45e3a 100644
--- a/drivers/media/i2c/saa717x.c
+++ b/drivers/media/i2c/saa717x.c
@@ -1088,7 +1088,7 @@ static int saa717x_s_stream(struct v4l2_subdev *sd, int enable)
 	struct saa717x_state *decoder = to_state(sd);
 
 	v4l2_dbg(1, debug, sd, "decoder %s output\n",
-			enable ? "enable" : "disable");
+			str_enable_disable(enable));
 	decoder->enable = enable;
 	saa717x_write(sd, 0x193, enable ? 0xa6 : 0x26);
 	return 0;

-- 
2.46.1.824.gd892dcdcdd-goog

