Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F79393A5A
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 May 2021 02:39:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Frm5b06mjz2yx2
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 May 2021 10:38:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dzDstQmF;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dzDstQmF; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Frm5V5rbpz2y07
 for <linux-aspeed@lists.ozlabs.org>; Fri, 28 May 2021 10:38:52 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id w7so3130122lji.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 May 2021 17:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3tZvKVXXK1CrsVCEdwk4kRijURbW1gkRo3MklbEt43g=;
 b=dzDstQmFnkHnT2yUIYKLBRRBS9fEvHqlCfVDyb072nsd2XLJcbMC9YytfAlVCe02vE
 w9imrgViRD9UmJFiNPktvwlhL+FSug8rzH1rndJtVlz3QQe+LaHVPjU6VmarHmQVjLz9
 xf8j7GTU197/jPwSsOeFHBpLr83hJSyRTW1TXntHZd/bB1uAuI+WQ+bhSHrv/SWtMmVd
 kyaH7en3LnMLvCu2BrfR+25SZJ37jTDiSZTB3f4yqmQeYCEoZnJSe4DbXuwQ/ieUoyZH
 Yg2q/hN5vESri9Wyb+J0nlja9X++NyijNUy+ePQmji3JkVQ2yCofSythjNO8OPePTRya
 28LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3tZvKVXXK1CrsVCEdwk4kRijURbW1gkRo3MklbEt43g=;
 b=uS0TEZsn9IwyybvUglNvvdAyKxz00wiWXOUJChBZB78qzWzrOFu0yYl4SgpCCNRjxM
 mB0eOxqpw7XBNyMPq4tD7Rif2qjRv/1fI0iwics34x8sWP6LO5EK7OpBGWIu6O2KCXJv
 /CacAXph3fqa9TovaL1MahdM3OPIYitfKP+i0KF5JpwHjz5+SgXe9HrmarqdHOnqKh3M
 5aB1AG7uyrR+ounvcSn8Yb7Is3LOVybqjRHtAhB8b+K48w4fRql2CvROwWxYyiL9lBuR
 x8PEdGaZpr7zJz0Z3ty++wO199FxB1SN9bgf1nv3+GPRTCRtlu8CFFCvsu5+rq5mFByr
 pC0g==
X-Gm-Message-State: AOAM530dcK33ZAinGK1fYzCLYNDb7Y/kjwcYpLT3Ea5NX/jbrHZZWLcQ
 1clRH+KUAkgt65sUOYbDCmx3cd8Nx0DD5V1ArmQKfw==
X-Google-Smtp-Source: ABdhPJz7njZd2vaMPN20MaL5HfLauAdefifx8indoEE9qbs7jFDoqG1iIPLF/BJ6sjZMAVRNssGVEUTUE+E+NW+cvHo=
X-Received: by 2002:a05:651c:4c6:: with SMTP id
 e6mr4571492lji.326.1622162328960; 
 Thu, 27 May 2021 17:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
In-Reply-To: <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 May 2021 02:38:38 +0200
Message-ID: <CACRpkdbZf_cTMppxfC4mM6XZ2YySH7dQ0NCY6v_pfwsdRzLPKA@mail.gmail.com>
Subject: Re: [PATCH 11/11] drm/tiny: drm_gem_simple_display_pipe_prepare_fb is
 the default
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Lechner <david@lechnology.com>, Emma Anholt <emma@anholt.net>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, xen-devel@lists.xenproject.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, May 21, 2021 at 11:10 AM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:

> Goes through all the drivers and deletes the default hook since it's
> the default now.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: David Lechner <david@lechnology.com>
> Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: xen-devel@lists.xenproject.org

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
