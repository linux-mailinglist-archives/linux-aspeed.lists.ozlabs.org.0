Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2503671057
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 02:43:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxT795Bxlz3bbR
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 12:43:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=da/8FrC3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com; envelope-from=alexdeucher@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=da/8FrC3;
	dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwgkM53Wjz2xKN
	for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Jan 2023 05:37:45 +1100 (AEDT)
Received: by mail-oi1-x230.google.com with SMTP id d127so24025533oif.12
        for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Jan 2023 10:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bz6Srssb7KxtWIp2StQowmALBQ/ecYiEATmxxDpLUgE=;
        b=da/8FrC3su8n4920e9FOvu1j/TWeGMIAZK3QFppvkb8spsp70RYdvbMm2q6kr8fatp
         5ZhAWveL0+ghlV+yoW55uxO1VApqKx7SI3P9NQE44tN5xuWeO0ji9XuxwTvr/dlc9rsT
         tVUpF37v44gwmO7bLXKdtbiGDN/w5BQAj3xAbBkq52KC4lJdYL5HB8bnXAJ4+Its3plb
         v4Jme9uznTgidvg/tGOHCdyd7VszsqLeOpmjJn9xH6h/dQojHZTl8CSLKaqG/edls6PK
         yQ1U3V9Jp+1Ca32YYe1xYlqr5URZI2+ZvAQNN1kMuPpVWR6dfbhkvE0JUVZPCO257Kdu
         QMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bz6Srssb7KxtWIp2StQowmALBQ/ecYiEATmxxDpLUgE=;
        b=UWQHsvor26OQ9zxe7x6FrFp10LhkqSqK2Ts4yl0FEzK4uBe6Lt0EqAQ4mCHXOgNkxd
         QkT4MCMe1r2+EjbL2uOdH7vybTjxDn4P2vvXyJ7v/eQh5Wr964c7TnYOhrAid6G5tsaH
         Rp34CV3dViKLAO3RMUj/8he85BJK0e7EjGhEcMXSt5UD8WbpfaXOSPZCN1aZ2TObKE0C
         /67+uS1Ok7e/Jeop8x1hYRQMFkaw+JzfH6frtMoTCeaCIP2qbImlgYh4reXPRKE1QF5I
         DulrLqUmQYxxg5IRJS9Ni2A+A0t0uwW1o7Kfcaz1Hp9ejXdHFYfwTNtMMaH7ByijnYeV
         xuBg==
X-Gm-Message-State: AFqh2kq3qkA29bz5AIwigH5ueRFubM3Z0tKCMPGmfiyYJOBVPLMHH/E9
	qu2e5c00zoGWvAsiKsW369jvxA6AAlK26ssWHrM=
X-Google-Smtp-Source: AMrXdXtOKveG9OHXqQHo9xNE/hNA9+TOjgR84/kFoTmzmkWJIw/wZWO6Z17PeC1Jr2qOmQVHIKAxEfu0US9MC60q0b0=
X-Received: by 2002:aca:2807:0:b0:35b:f5f7:3ed0 with SMTP id
 7-20020aca2807000000b0035bf5f73ed0mr17751oix.46.1673894262477; Mon, 16 Jan
 2023 10:37:42 -0800 (PST)
MIME-Version: 1.0
References: <20230116131235.18917-1-tzimmermann@suse.de> <87k01me9jn.fsf@intel.com>
In-Reply-To: <87k01me9jn.fsf@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jan 2023 13:37:31 -0500
Message-ID: <CADnq5_PsL8N27_LC_h1m8i_FCg6mJtr7K9Yjv=guw-KGD2wU5w@mail.gmail.com>
Subject: Re: [PATCH 00/22] drm: Remove includes for drm_crtc_helper.h
To: Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 18 Jan 2023 12:41:55 +1100
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-aspeed@lists.ozlabs.org, sam@ravnborg.org, linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch, nouveau@lists.freedesktop.org, airlied@gmail.com, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jan 16, 2023 at 11:20 AM Jani Nikula
<jani.nikula@linux.intel.com> wrote:
>
> On Mon, 16 Jan 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > A lot of source files include drm_crtc_helper.h for its contained
> > include statements. This leads to excessive compile-time dependencies.
> >
> > Where possible, remove the include statements for drm_crtc_helper.h
> > and include the required source files directly. Also remove the
> > include statements from drm_crtc_helper.h itself, which doesn't need
> > most of them.
> >
> > I built this patchset on x86-64, aarch64 and arm. Hopefully I found
> > all include dependencies.
>
> I think this is the right direction and I support this. Personally I
> think it's enough to build test and fix any fallout afterwards.
>
> To that end, I did build test this myself with my config, and it was
> fine, though that probably doesn't add much coverage.
>
> FWIW,
>
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Agreed.  I applied 1/22 since it was an unrelated cleanup, but the
rest of the series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
>
> --
> Jani Nikula, Intel Open Source Graphics Center
