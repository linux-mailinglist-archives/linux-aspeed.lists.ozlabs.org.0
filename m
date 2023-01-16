Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3610A671056
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 02:43:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxT7506k9z3c8N
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 12:43:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pJUbclSZ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=alexdeucher@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pJUbclSZ;
	dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nwg1n2Z9yz3Wtp
	for <linux-aspeed@lists.ozlabs.org>; Tue, 17 Jan 2023 05:06:03 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id p185so2894954oif.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Jan 2023 10:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jS6lFIJFjFUtY3mw8cyMrgKm76WlKsu232wNoOu9BFI=;
        b=pJUbclSZ3i6Jdg01liLqHc4w2CrtWVSvaOfhA/DUvmwvBfI9LV/fSr9f0+RsBvfbLx
         mSuHpfqzVwUOvdgr8BT+nESWO/0QhJY7FYtEC48w4a2xddiPX+BPDav7qXMtorGbTXUq
         hjQMR/WAaB4ryPMo9lf54fjFLNek6uWrPFOwM6l8Xd/xDdB6xaxgevUnUfNn/0eWYNTc
         bKMw7E9OC5EgqTES2vcg5jM7PqToB0TgsIByf+obkVK3lyB6P/PcTiK4JkRpIAYBGTyB
         1Id0dsqzXGVrfVIItHtSGIEkdKnSeVlrgExRRUQaOVdZ/2a73hix4y96Jlu2eI2bS7Za
         OBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jS6lFIJFjFUtY3mw8cyMrgKm76WlKsu232wNoOu9BFI=;
        b=x3YK06go0GvgJ1IGzb7TArvGPrnJ3YNQRPQCkW5wi2GzkOXVxC9HGEPk+e0dfd+NGW
         4b5rY0NYTiVuWMbjuWJmqag3fj/nYn3jayG2yMtyl4BcM0JNrDZKiIkZtYptL8njv912
         SllaxX0Dt3R+LAKupBMV96pLRbWwWevYlNGZFCuHIe0zrd36n8/cZYKIQvt1z55azRIH
         ZQVvxw/riiTK2pQB/beKdLPqJFn46jWCLwBrzMDmJKn9+D/V03HrUUy2tr75urgvKnQX
         00lYGM1LUN/ExZTfzeHbWYNgQuyMcXD8IL//9YBXO3M7r49z7rkv5iR6eQt3AChXKiKK
         uIYw==
X-Gm-Message-State: AFqh2kq8KS1zWvum+wSsAYB/7dFSQ64ou3fEIsS1avo5kJMP5hlBGceD
	i1vPVTzUvKByvmg3NJjKGP0tAPwjloVBDtiqQ44=
X-Google-Smtp-Source: AMrXdXvrZGLO62Oo0eXSOIOLUZCvlkDtQzC8DtTWKD6P/g/Ade7N08+e9NEuxmouzOQHO07H0ArjVT5oqOGIBob8wbI=
X-Received: by 2002:a05:6808:4387:b0:35b:d93f:cbc4 with SMTP id
 dz7-20020a056808438700b0035bd93fcbc4mr8161oib.96.1673892358616; Mon, 16 Jan
 2023 10:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20230116131235.18917-1-tzimmermann@suse.de> <20230116131235.18917-2-tzimmermann@suse.de>
In-Reply-To: <20230116131235.18917-2-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jan 2023 13:05:47 -0500
Message-ID: <CADnq5_P4DgCi_JwXo2fJS=cCBmumsw5Og5ZYt+J4J_Lak74e0Q@mail.gmail.com>
Subject: Re: [PATCH 01/22] drm/amdgpu: Fix coding style
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, sam@ravnborg.org, linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch, nouveau@lists.freedesktop.org, airlied@gmail.com, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Applied.  Thanks!
On Mon, Jan 16, 2023 at 8:13 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Align a closing brace and remove trailing whitespaces. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index e47058c2c294..0993ee91fe18 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5871,8 +5871,8 @@ void amdgpu_device_invalidate_hdp(struct amdgpu_device *adev,
>  int amdgpu_in_reset(struct amdgpu_device *adev)
>  {
>         return atomic_read(&adev->reset_domain->in_gpu_reset);
> -       }
> -
> +}
> +
>  /**
>   * amdgpu_device_halt() - bring hardware to some kind of halt state
>   *
> --
> 2.39.0
>
