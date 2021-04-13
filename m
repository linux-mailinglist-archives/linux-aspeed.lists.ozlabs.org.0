Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E0735E836
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Apr 2021 23:24:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKdsp1wz5z3bqv
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Apr 2021 07:24:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=qwu/z3wT;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=qwu/z3wT; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKdsL3YRKz302y
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Apr 2021 07:24:20 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso9673074pjb.3
 for <linux-aspeed@lists.ozlabs.org>; Tue, 13 Apr 2021 14:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wrolm9Uka0WdrJmXFojnSsyQPM9UJRCVltTGkkPQseY=;
 b=qwu/z3wTrpp5MMaWa7l3cQz4itDaaPHW3JyggVWUDu3sP+rMVEPc7SnPa4fTdHWXWk
 US2+KYZ4o7q6l9qGxwduHbyi5n0IeuW62U3Suibh8TnTfgI0IZOCKOb9aLASA7+pEW42
 ggG9UjpBKBRfvFNiusX16PXpetzhMCieq36otySqrUqD+GMZ/kZDZuDSLhtyi9NRA3xF
 L1zea2cz+qTwKpPP6B/UmmalWKtvDjg5VOLuMzhJrRpIhlXV/3gIYO6Tkf5eHNOh6T5o
 zMcmKvlsqba+0XKpDOephk9dxALnyh2Lf0h0AxtruUZOc6HscSq5KEQj8eDCNlh4mFyU
 iwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wrolm9Uka0WdrJmXFojnSsyQPM9UJRCVltTGkkPQseY=;
 b=pmcgXogKRTjw+zRswEtjhnkpBPjCedChxRsAzn2xolT4sRm1yi7jFFD/B2cJVYYtTD
 lvq6RYH37lT+HtHLoEZoSEQ0J4C8O8wMzIZ8+cUthHyBhpr7YDIaDtNsbCaBuQf/tlrh
 35LOuYgbKgN27EPs8VaSUclpFkAkYxQBrYXsHrldafHhZQvhOBm5CoGMcBOj1pfIytGX
 kLOnHW0a9qwatkY4KWbwmwSL5EvUyDmQPREfa6y2cMcAMJF16nQvqj1H4fMsZctfGsFr
 WaXpgI8E35dco5gNtS9dLLTbFfATAVK3XS1Qs+GFqLXvfgPXK6q5ws2Cs98hTKoLfo37
 APyQ==
X-Gm-Message-State: AOAM5309HlJONuESdCtmrxUGXKpvGHCGLM1+G1FVZNU+DSl3oS/qz/sa
 22lJMXwVN70ZvhqGvgqdSPU9iSP/p9MfPfN0MLjcSw==
X-Google-Smtp-Source: ABdhPJxORhjMtdH97VTzoYhToT5Sfmca+N6V6zwa7pA3FPVL1L6OGFpc6sJYDeZN7H6NBHUzbo9M08UkzVohS29TCfc=
X-Received: by 2002:a17:90a:ff02:: with SMTP id
 ce2mr2072837pjb.217.1618349055195; 
 Tue, 13 Apr 2021 14:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
 <20210224191720.7724-4-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20210224191720.7724-4-jae.hyun.yoo@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 13 Apr 2021 14:24:04 -0700
Message-ID: <CAFd5g452cbyy0Cu=z952X_WMNUoh5TtHvUpDQpA4-APodxZnpQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] i2c: aspeed: add buffer mode transfer support
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-i2c@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Cedric Le Goater <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Feb 24, 2021 at 11:04 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> This driver uses byte mode that makes lots of interrupt calls
> which isn't good for performance and it makes the driver very
> timing sensitive. To improve performance of the driver, this commit
> adds buffer mode transfer support which uses I2C SRAM buffer
> instead of using a single byte buffer.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Tested-by: Tao Ren <taoren@fb.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
