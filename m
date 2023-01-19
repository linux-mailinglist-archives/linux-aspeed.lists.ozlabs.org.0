Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A4367470F
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Jan 2023 00:19:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nydql3GLzz3fGv
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Jan 2023 10:19:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KomxW5KB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KomxW5KB;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nydqd6yhpz3fDp
	for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Jan 2023 10:19:07 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id x24-20020a17090ab01800b00229f43b506fso2371023pjq.5
        for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Jan 2023 15:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/ilKkanRDG4JMRNJZhSyuGw6MOjoRO1ltuCrj5OHYBY=;
        b=KomxW5KBKUvMS5CoWsHvbbq4yFDHmnfeYOztiq4v7c0Q+IHeAbP8E94IMSj4tCaqQD
         NgVwjQE+76ApcD8SPrWM9BXiHyHo/sHhrRpyhmBLXd3i1R1kaxOw2MnQUzUdaVxieuou
         xA2PHLZXvvGhxA8INYYJdznR0NAzXfB0sKnWqnZNijeXeYypiszihn0/tHxwLip5TCNW
         0T5l9IdRhT9UqK5dvlXqL85rIcgoiFkfx/1jbbA9ds3W0Warba42nTAxpZMpxJBqchEb
         N/4TOjVSWjBGdRn9GqSgpSvCh/drClfhqtQ6K3j6g595MPEZlaGzHZ9Z3lR31IdNidy1
         WSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ilKkanRDG4JMRNJZhSyuGw6MOjoRO1ltuCrj5OHYBY=;
        b=MiH9tVa7nnWcoo+R7um5xA8JaEKcWu8m3SevBHmjCK8qtPwp0cEpcss/uc8tK9quEB
         qeA4GKRNRwxcsXdyQJvOspMUbfcfeAPp1ebceiL5pPKhAs67Xh16E5MgeiwshSJQJ1Rq
         QFvWMElok6Odr104j8RBlH67ugS8x92bM8h4vohpUVS22cf+cgEOx5dhRiy2zZs79jH8
         ZV1co0ytfDSJQDRd6QuQoK6YFCL5yQPpDmWzE81AidC3CoUGukO6qXatIwbgye8XoZQW
         zXuAD+c+fZp21pz6YHxoSXCzQq16vUt04bTwfUMSrkZaBjXwRPxnUqXzNVLlhSu/eBpZ
         1kSQ==
X-Gm-Message-State: AFqh2kq6W6lizjp15n11+NaXkUbmwArdUM/phk3lsKwHPEb3r1yPaRPU
	luOcZTHfm6RcCf9y/kDWthg=
X-Google-Smtp-Source: AMrXdXvSOLIuxoj4Y7RvpgKZSKJxrOxqjeUcCBbc/3tk2GwQVVfsxG++z8XzJce6HBomoV1QGhkdNw==
X-Received: by 2002:a17:902:eb44:b0:194:84eb:290a with SMTP id i4-20020a170902eb4400b0019484eb290amr13223485pli.50.1674170345106;
        Thu, 19 Jan 2023 15:19:05 -0800 (PST)
Received: from voyager.lan ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id h11-20020a170902748b00b001948ff5cc32sm597586pll.215.2023.01.19.15.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 15:19:04 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: aspeed: Fix confusing types in return value
Date: Fri, 20 Jan 2023 09:48:56 +1030
Message-Id: <20230119231856.52014-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The function signature is int, but we return a bool. Instead return a
negative errno as the kerneldoc suggests.

Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index a30912a92f05..f93d6959cee9 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -113,7 +113,7 @@ static int aspeed_disable_sig(struct aspeed_pinmux_data *ctx,
 	int ret = 0;
 
 	if (!exprs)
-		return true;
+		return -EINVAL;
 
 	while (*exprs && !ret) {
 		ret = aspeed_sig_expr_disable(ctx, *exprs);
-- 
2.39.0

