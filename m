Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F03753C836
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Jun 2022 12:13:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDzHV3YxLz3bmr
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Jun 2022 20:13:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cWnKkwPu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cWnKkwPu;
	dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDzHM5K27z3bbQ
	for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Jun 2022 20:13:33 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id e184so12895559ybf.8
        for <linux-aspeed@lists.ozlabs.org>; Fri, 03 Jun 2022 03:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=94ZegRhkYg/saXV+SmkOjrIFO68BuJxSlLGLu4NRWgI=;
        b=cWnKkwPusG0TKPrwdSeL9GfiK9qV2jq8XHQI841ZQi14sBambMQZLS563NvaLZElf2
         75115UwtrmhkAHVhZHmiunsBxqODjE2sgZG5RZUUttFd/XjwT9ELF81y1MF+VjPTBsXy
         Ecc+OxP4Ug9Nkq1KWYx7PsS/8LdlHSvr8pmzuBVF4JJSNw/zCKM/57awLBnHtRJH+URJ
         ivbdaF8SKbVQFRj++AP6rq74w+ppYkrOD3IrIlaZnu3m6qTtGWAs0bfx8BngaVgPvKTf
         vdUOkox69Qac8HsvfBibu1f9UhbH8lmh5VamMeFlCaOhbP7O16w6ZyMfyL8EpGm81ssR
         AiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=94ZegRhkYg/saXV+SmkOjrIFO68BuJxSlLGLu4NRWgI=;
        b=1s3CXrKJTFfdgzOiQJ7yQmOXxU6rq88mTjhNZKDzl0bwBDb1PWLrlC9FnxjLiW7rAc
         F/Q+RfiDwicjsKkl9IjHStV7LnuvFJ2Ozb1kpcQ8N3XFl2C4jWXRdoXdvS7Fkil9+T0+
         iBQ43WkNKo7+87fepGyNFcGvxiwpjsXdWi5cNTVPrYIYzPGc52GaIHh12TMaVYpF0MQS
         rk/4XPmX34XE/t5b3jay/nqqdvKloZmPfzZ/XCv8j0hV2Aee5F7tVpRd48GPnzo9lSge
         nIiO4fvzAKyXupow54FEXfUwjfLjqTCXQMfpR4Cl7fFVYxWoyz2Tas7B7htJe9lSGZpI
         sdPg==
X-Gm-Message-State: AOAM532oUycFyut2GiqwN4MyrWLkwXTgEFeA2A9ASVVtpvZefWDSajrz
	8tjUVVVub5AeG+2q3i6pyuMtpPGxpw9MHQiCjdx1xA==
X-Google-Smtp-Source: ABdhPJw/KRcAuBS5Qsp7lOCZIpBhbUKTpsBgops20ECaxi3YO08dKdMkgM9KLeB4ACdlmuIwzLo5Lgpc34BZ5v0Gd3Y=
X-Received: by 2002:a5b:302:0:b0:64b:a20a:fcd9 with SMTP id
 j2-20020a5b0302000000b0064ba20afcd9mr10098240ybp.492.1654251210044; Fri, 03
 Jun 2022 03:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <1650508019-22554-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1650508019-22554-1-git-send-email-baihaowen@meizu.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 Jun 2022 12:13:18 +0200
Message-ID: <CACRpkdZPZ5fNxt3=LCT4YRcnH5wNw+i50dde_eQGynzK0FCXFw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix potential NULL dereference in aspeed_pinmux_set_mux()
To: Haowen Bai <baihaowen@meizu.com>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Apr 21, 2022 at 4:28 AM Haowen Bai <baihaowen@meizu.com> wrote:

> pdesc could be null but still dereference pdesc->name and it will lead to
> a null pointer access. So we move a null check before dereference.
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>

Patch applied, sorry for missing it!

Yours,
Linus Walleij
