Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D323233B7
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Feb 2021 23:31:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlYgx14xqz30QK
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Feb 2021 09:31:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=t4xgPhOx;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=t4xgPhOx; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlYgS2vX7z30JR
 for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Feb 2021 09:31:30 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id e9so2988732pjj.0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Feb 2021 14:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k1RzooZPZP1J4eGG1QIqaiAicm+Bu37ef5lc5yWEgH4=;
 b=t4xgPhOx/fSPdt9GfCu0R0De6/bDyWxmpEoRAnUJr3nOJHDifQWPwxokNt7mbELdv/
 bhXSf11bwUOi27tQcVlvVJPHO1IlOMaYoZugaRUA1LaNr3mDwYkdIZqTisVGAitkICPB
 SksJBCEwx31Zlzzx9qOeouKee4op1oBaHz6DunH3WeM4GcOaLffIiaxJ27Ae9+YfKPry
 MCb8qfSwnexxFOFNvhL1BV9lm+5yUsCqGRDaVHYeSjHKah5yInwLAxwbglzR9X7T/AN+
 uDOEaT977YBIAKlTyM5bpzHZabZwgUGEiJ5ZI/XtQJMq9u9AE+TZe7ellMGmv9G/Ixxn
 Fbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k1RzooZPZP1J4eGG1QIqaiAicm+Bu37ef5lc5yWEgH4=;
 b=bcbWAvjJjxGQFwMATM0VKqQ0H7nkZTjJ3KWrlCVdOPYGUiz0JTN782kdOxAb4OgLIH
 YkByZzyqIdVu7ypxdL/GDDyMjfNBm7sv0edMicBLy4M/WUdxx/YGPxK2wKYqpWAzvg2J
 ErrjFJWFmCRH4xJ1cMTYLvQonivrCjun/6USdM5Avn4fq+jfcwM8Oshs5z+Glh/Jtao7
 xpGgztjckrBpWee+FF2qeuNgSBMsm62+qWM1etgXbBFSZ+r5xhkGKc5CNE6c9K3+cFcD
 LMRwfMSs63C19mrM54JkAkAGElLmSepXIlFDiRIlf4VmU8YiGPgaloWb6LUiiWiNDucA
 adfQ==
X-Gm-Message-State: AOAM5327q+xjU/dGBO8Gfz7IZWArtXkLu+f7pF0hVJ9TRMqf/aup2ofK
 kxUG8t53qBNL/Fxcyuj1HNx2g3BYef06WFWI/nUVfg==
X-Google-Smtp-Source: ABdhPJz6AeMs16zm2xQVDtus3cuIEyeB5wTXLC2MGx6pelc1e0zKNRbFQm3TdaKPHwXT9D9EujJ0ZjjXUTabbAv7Wqg=
X-Received: by 2002:a17:90a:e64a:: with SMTP id
 ep10mr1079603pjb.20.1614119487708; 
 Tue, 23 Feb 2021 14:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20210216182735.11639-1-jae.hyun.yoo@linux.intel.com>
 <20210216182735.11639-2-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20210216182735.11639-2-jae.hyun.yoo@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 23 Feb 2021 14:31:16 -0800
Message-ID: <CAFd5g44agiB+d5_RuMmL7=exhzUt=aSMEWMEgEkbAZCgH0JbJA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: i2c: aspeed: add transfer mode support
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

On Tue, Feb 16, 2021 at 10:15 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> Append bindings to support transfer mode.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
