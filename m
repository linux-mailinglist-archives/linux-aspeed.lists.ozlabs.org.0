Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3331467E547
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Jan 2023 13:33:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3H706HGzz3cH1
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Jan 2023 23:33:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RxEhBD/W;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RxEhBD/W;
	dkim-atps=neutral
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3H6s3l2zz3cH1
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Jan 2023 23:33:22 +1100 (AEDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-50660e2d2ffso65294717b3.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Jan 2023 04:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rQ0envBKZILqHzUO+F+Zje3FulFWG4VE6MBPBgvm4Fg=;
        b=RxEhBD/W5Ke3tWjLCBPjfXPbcb2+7ZI9a78+cUTicFF3MMtONaLqwvKFvd6034xFRg
         TkYVQSiRrDZDSKcWy9SvYN0X61T16Mfx/Wvlw6EiGobxwLy6xh6S9OkjRA0E8uT9F8uS
         ZcuxIvdynQUoHNLsZddBjjeOy5hGbNB0waWspEcfF9tV7xuqh72LeULKlYFPTY//OXsM
         9YFUJOW8o/j40kzvXdOlUMWuZMIaUb2iA6jF//rwv1vPwu+U6yeSpVj/wfmsW7+AODHW
         CFBCbB8UBeijAAQhjAtKMhj8axcFzqOSUY0nv663zNjAG6HfSMSWDLmwNd9FQkCpjis/
         Kb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQ0envBKZILqHzUO+F+Zje3FulFWG4VE6MBPBgvm4Fg=;
        b=oJ+pvhE+IYxK0iBUlafU5BStrFJD3Gwx9Xk6XQ6oUb8TpWgYVpua1S49pAXx1kQZCd
         5PYLkc2SVWnKiyzL72KfaEYqqg708GZIucltmysBmV0MSUW8rtckiI2+HeprmWa4CgXq
         hOJdUeTadmGKQfIaaC41j+mTExIr6ecbsiDgEx9MVE0s6LheNR7XNXHXOSEU+WX+OVpL
         6cnlQC6832I76B2FHQObjNEungo7k7Cj5DGv2dba9V6rUP7y+RYL74gkG0SFS/49RXiR
         ItchIpiSJfJ0LgscfNB/4HtKWm8Rgw9ks+Uf4AgbZV757krcBfpGBW7ekp6VYl1d/vbW
         Ua4g==
X-Gm-Message-State: AO0yUKXPAbjrY2/a2l2/dVk3e4uiYlloKdbku9V4qlvjMKipj+UHhxrC
	klVNAzbhqS8+Ml8ETenAN3xRgevvJGo2sE+fOzQwFw==
X-Google-Smtp-Source: AK7set96w+IW8ATycCAAKWTW/ZH9c8VFAZ1lyfXYdCAOBDbMOCUoct9VzwQAx1jXdTkqxZOMmvW57pokn4Dfdjrc7aE=
X-Received: by 2002:a05:690c:706:b0:506:6952:b9c9 with SMTP id
 bs6-20020a05690c070600b005066952b9c9mr1258217ywb.477.1674822798220; Fri, 27
 Jan 2023 04:33:18 -0800 (PST)
MIME-Version: 1.0
References: <20230119231856.52014-1-joel@jms.id.au>
In-Reply-To: <20230119231856.52014-1-joel@jms.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Jan 2023 13:33:06 +0100
Message-ID: <CACRpkdbR1O66L0UHG2cAq-d7smuqFQoAMtSEO2L=3za6ELN7mg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix confusing types in return value
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Jan 20, 2023 at 12:19 AM Joel Stanley <joel@jms.id.au> wrote:

> The function signature is int, but we return a bool. Instead return a
> negative errno as the kerneldoc suggests.
>
> Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Patch applied for fixes!

Yours,
Linus Walleij
