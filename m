Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 086416AD165
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Mar 2023 23:19:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVtKZ6YX8z3bTc
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 09:19:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ICZbYBbM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ICZbYBbM;
	dkim-atps=neutral
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVtKR5pcvz2xG9
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Mar 2023 09:19:23 +1100 (AEDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-536af432ee5so212104387b3.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Mar 2023 14:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678141159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIwy9GGWWk7FRheyk7kQvNm+28TrmRYb7v9Ze4E4qE4=;
        b=ICZbYBbMVaIDZmAFB6H5iCrhGOEY35M31GUKkKobfQ8xltOrmn8D7FBBCOITMcflZS
         tG44B2qro/h5+lzF6tMxsW8eAPNd9g34RzZohr48LOpkOe65wBRX5KoI/Ijr40eZ47u0
         hg9LCHTphHBINZkB8S5Stwn7tdrs6yBXkgkm5ESSb9puGdqGNkOVYFJ7AlZ5nH8WM/BX
         VLXoEQKY4rimQFW9XQI71Ag9FOrsXPDGATyku/a5MWV099Hb/BvLMCqc0tbzZW/EPoo/
         JYcXWDx5G47YQPkidEUVePtZhKEOq7OFI76H8ngB+J188eN8H6kWVzpgqs5QTDJcNVaE
         PWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678141159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIwy9GGWWk7FRheyk7kQvNm+28TrmRYb7v9Ze4E4qE4=;
        b=y6Od9lfoEY8QMD+ye47Reu47WkHQnYD9meFimst+kOAExPbHqfklMr14ys89Rvuz9W
         WhoJWVBj27apE5H779T/XSSxWT1yDSe8ELy7kEy1/dNhgpnSI7GaVgKoKvqt2582s6+q
         8g71qkW0oXhriy9SriKZQKsE0zuVdhwQwcXUohdYpq44QtxYVILy5mlPC43uZc4V0yfF
         V4G500MNG8lTCM37Cmo+fEbW3bFdsUN4RX52Eyyaf0Z/RfFPwtUEdaK799K9hMVoCVWQ
         YcQbi/0FbOJ9lkdBhv6I3Kl1xo0Ufv1vLiYZYUuSp/3CQX+f8EBit5yRp+kkqbp9KSym
         PQmw==
X-Gm-Message-State: AO0yUKWTaSQDcIEU9jVhWJkMxPElbbW+TGLyGLlRS19HSEecU0UsPr+o
	kJaQMb05TJBTM2JLU+25O0fWj1SAy3KpQL0X629NHQ==
X-Google-Smtp-Source: AK7set+FEBHOTN7jH6jw+W4M/INkl80XRa4XzqDzPxdd9YGD5yqFWOonMchaUl4aHKnjh/2xQeNLpP3z0RkBrl7WU5s=
X-Received: by 2002:a81:b705:0:b0:535:fe26:acc with SMTP id
 v5-20020a81b705000000b00535fe260accmr7785857ywh.10.1678141159600; Mon, 06 Mar
 2023 14:19:19 -0800 (PST)
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de> <20230301153101.4282-21-tzimmermann@suse.de>
In-Reply-To: <20230301153101.4282-21-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 23:19:08 +0100
Message-ID: <CACRpkdYS54Svj=B-NfrjX+kBDYw5e9Jyt70L0tr_iX5+mVYK4A@mail.gmail.com>
Subject: Re: [PATCH 20/22] drm/tve200: Use GEM DMA fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, edmund.j.dea@intel.com, alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, anitha.chrisanthus@intel.com, festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, samuel@sholland.org, airlied@gmail.com, javierm@redhat.com, jernej.skrabec@gmail.com, linux-imx@nxp.com, alain.volmat@foss.st.com, linux-sunxi@lists.linux.dev, p.zabel@pengutronix.de, daniel@ffwll.ch, raphael.gallais-pou@foss.st.com, martin.blumenstingl@googlemail.com, s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, laurentiu.palcu@oss.nxp.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, hyun.kwon@xilinx.com, tomba@kernel.org, jyri.sarha@iki.fi, yannick.fertre@foss.st.com, philippe.cornu@foss.st.com, kernel@pengutronix.de, khilman@baylibre.com, shawnguo@kernel.org, l.stach@pengutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Mar 1, 2023 at 4:31=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

That sounds neat:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
