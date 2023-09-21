Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 627DA7A9AC1
	for <lists+linux-aspeed@lfdr.de>; Thu, 21 Sep 2023 20:48:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OwTIagEy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs4DD1Lgxz3cTK
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Sep 2023 04:48:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OwTIagEy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs4D35WMJz3cGM
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Sep 2023 04:48:19 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5335d9045b4so496709a12.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Sep 2023 11:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695322095; x=1695926895; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brAzGA2XEfmHNJOmgEz0xYZn4CECqGMWBMjfuyGkpN0=;
        b=OwTIagEyY3PwlSFauaE2DH+Mz7gWilWA6intrNOllsi6n+ynFfXaWzhewJrQkeDwb9
         SpFcWIcNMz+GcYNkgl44cVnWa3lkNSrrAm0QIxyWkgpF2xtQHWEtHPmGW2Cde6X7O6Mg
         7Zc996hS1mt0fJVbntpYcYwScDAlw1t5J5E8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695322095; x=1695926895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brAzGA2XEfmHNJOmgEz0xYZn4CECqGMWBMjfuyGkpN0=;
        b=Xa/dWoPN9m00qvZAGKyxzYyiSZroTU6vOyvRLrlbv/NxeJajRRLt4UawMeSU56iOeK
         A6V08XA2KvjQde/ABps/W2rYjXH/It8zabK/7/tq2KefmCZLExGHIJGi7Q1O77e0hKVS
         8KXEawI+IfiY3KI6q97Igu5NFYMomCsFBmbO0KkapNJPmdPpG0s8MrIPube4KuJL4XN6
         SdPmdnwwAsA9fUnxm6Y5mHxPdk34z0atuHLtYFO9W0UHk1N54Hloq+seS2zT4DPEw5Kh
         2wjTJSj/cWdTyDEcWpPEQOp/opkrPXpaMrFAFQ/D7KP9eeLulpZBiYuG8pV1mRP29rwk
         CIXw==
X-Gm-Message-State: AOJu0YyIqMo/Y4js411h1DOIS6PAVdt5SeWezXPy2QkYAQg5NPZHH5/y
	vpvFdqFuV2KPBRT9bveCDezM+GLy6mNjfAavjFNmG5um
X-Google-Smtp-Source: AGHT+IHXvXjN9vmBkK/KIzzjP+qRed9wIx8nsCligSn7jPGuc2+kpIq8lNtlKMy34p3xBejNXkh+xQ==
X-Received: by 2002:aa7:d758:0:b0:522:3d36:ff27 with SMTP id a24-20020aa7d758000000b005223d36ff27mr5563409eds.31.1695322094724;
        Thu, 21 Sep 2023 11:48:14 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id l14-20020aa7cace000000b0053331f9094dsm1193458edt.52.2023.09.21.11.48.14
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 11:48:14 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4053a7b36b0so17255e9.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 21 Sep 2023 11:48:14 -0700 (PDT)
X-Received: by 2002:a05:600c:4c19:b0:3fe:d691:7d63 with SMTP id
 d25-20020a05600c4c1900b003fed6917d63mr120103wmp.6.1695322093885; Thu, 21 Sep
 2023 11:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234015.566018-1-dianders@chromium.org> <20230901163944.RFT.5.I771eb4bd03d8772b19e7dcfaef3e2c167bce5846@changeid>
In-Reply-To: <20230901163944.RFT.5.I771eb4bd03d8772b19e7dcfaef3e2c167bce5846@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Sep 2023 11:48:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vvqd76m-i2vbpVoiTir18S4ceFTd17nGdH1yU+9jhfDw@mail.gmail.com>
Message-ID: <CAD=FV=Vvqd76m-i2vbpVoiTir18S4ceFTd17nGdH1yU+9jhfDw@mail.gmail.com>
Subject: Re: [RFT PATCH 5/6] drm: Call drm_atomic_helper_shutdown() at
 shutdown/remove time for misc drivers
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
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
Cc: mcoquelin.stm32@gmail.com, jfalempe@redhat.com, yannick.fertre@foss.st.com, linux-aspeed@lists.ozlabs.org, emma@anholt.net, raphael.gallais-pou@foss.st.com, jyri.sarha@iki.fi, linus.walleij@linaro.org, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, hdegoede@redhat.com, daniel@ffwll.ch, tomi.valkeinen@ideasonboard.com, tzimmermann@suse.de, airlied@redhat.com, airlied@gmail.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, philippe.cornu@foss.st.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi,

On Fri, Sep 1, 2023 at 4:41=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> Based on grepping through the source code these drivers appear to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time
> and at driver remove (or unbind) time. Among other things, this means
> that if a panel is in use that it won't be cleanly powered off at
> system shutdown time.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart and at driver remove (or unbind) time comes
> straight out of the kernel doc "driver instance overview" in
> drm_drv.c.
>
> A few notes about these fixes:
> - I confirmed that these drivers were all DRIVER_MODESET type drivers,
>   which I believe makes this relevant.
> - I confirmed that these drivers were all DRIVER_ATOMIC.
> - When adding drm_atomic_helper_shutdown() to the remove/unbind path,
>   I added it after drm_kms_helper_poll_fini() when the driver had
>   it. This seemed to be what other drivers did. If
>   drm_kms_helper_poll_fini() wasn't there I added it straight after
>   drm_dev_unregister().
> - This patch deals with drivers using the component model in similar
>   ways as the patch ("drm: Call drm_atomic_helper_shutdown() at
>   shutdown time for misc drivers")
> - These fixes rely on the patch ("drm/atomic-helper:
>   drm_atomic_helper_shutdown(NULL) should be a noop") to simplify
>   shutdown.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c |  7 +++++++
>  drivers/gpu/drm/mgag200/mgag200_drv.c   |  8 ++++++++
>  drivers/gpu/drm/pl111/pl111_drv.c       |  7 +++++++
>  drivers/gpu/drm/stm/drv.c               |  7 +++++++
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c     | 11 ++++++++++-
>  drivers/gpu/drm/tve200/tve200_drv.c     |  7 +++++++
>  drivers/gpu/drm/vboxvideo/vbox_drv.c    | 10 ++++++++++
>  7 files changed, 56 insertions(+), 1 deletion(-)

Landed on drm-misc-next:

3c4babae3c4a drm: Call drm_atomic_helper_shutdown() at shutdown/remove
time for misc drivers
