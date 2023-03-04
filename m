Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C09D6AACCA
	for <lists+linux-aspeed@lfdr.de>; Sat,  4 Mar 2023 22:53:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PTdrT56tTz3bdV
	for <lists+linux-aspeed@lfdr.de>; Sun,  5 Mar 2023 08:53:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20210112 header.b=EjDJ1R8F;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=googlemail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=martin.blumenstingl@googlemail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20210112 header.b=EjDJ1R8F;
	dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PTdrK3zmlz3bVD
	for <linux-aspeed@lists.ozlabs.org>; Sun,  5 Mar 2023 08:53:20 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id o12so23857073edb.9
        for <linux-aspeed@lists.ozlabs.org>; Sat, 04 Mar 2023 13:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glTmX378wFhL+15561BIoVBCccNOW4FDXoOgifMHBy8=;
        b=EjDJ1R8FKouJnuSxadiRe5SiBIgUSITPbM9SnQjhYDyIZ+LuEOc2GfJjRvdd1K10zP
         0B+VLs/N+kcVjphefjob7VPueiCtPcbheJAVql624mVmTFTwLvvcp1iZwDpKctQLPUHW
         891sEv52O94DJnZ6KiXRE4F/ROjfjMTPMKKI+OF6yfwNHXTh46djS1YKS+5RgOvxGYeH
         ZkMiXVI3btf5P7xmeL3czwdHnO3oxMI8+Piuk+XkuMFjbmF1+Tu4Euz0RahvlkxQA0+9
         WfciGbFo0TezFdbslWClljVVfxIS/uCJg+p/6L25hJAymiS1NrGxJW4JFm2298dmi6Zx
         AF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glTmX378wFhL+15561BIoVBCccNOW4FDXoOgifMHBy8=;
        b=5FHO9zgkrmMvwjkx6NCRvOs3ycJj+T5PfF6H2psPtP+/JMXqK3oP2mOFkqmxoyUdER
         HUudbtjFQn/pD3crFlsnqQrN30UxYlt8azNtmGcUfdhkiRMq0Pn30/1CUj6L2LSA+Kz0
         a0PMQWZBJvxP3kHlMU6bPiuoaxCkbUl0hyj+ObvOugq2y4bJVOdzf0cPFhkolzCa0uAx
         pNeKvECKlDbTVVM3RbOa+BYvdJ/nOHC/WWeopKTapSIjbHQ6ELO9OPwkAHGeZPe1tDWg
         XfhR1RUtksk2pRB/31a8yynLB687NUtrLvic2+thbC5hBS9e+Z/YtCl6Qe0vCt82w7jO
         nNNw==
X-Gm-Message-State: AO0yUKVRElusFtNgiiGOClzuO04H5GnxOF9wo5TaWkgYgn7NHJPadKIB
	vY4VLKqx53pILAniAnxbVgCZyJbxoysxO79DvBw=
X-Google-Smtp-Source: AK7set+tmz2IUyxluM6H0uJ7rtHOVvVTQ1X6COH7sceQzb5b5yCqFKVzBbXboRNMEcYH9cGeInLEcv9muAb3OM5khBI=
X-Received: by 2002:a50:ce19:0:b0:4bc:2776:5b61 with SMTP id
 y25-20020a50ce19000000b004bc27765b61mr3356647edi.6.1677966793189; Sat, 04 Mar
 2023 13:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20230301153101.4282-1-tzimmermann@suse.de> <20230301153101.4282-12-tzimmermann@suse.de>
In-Reply-To: <20230301153101.4282-12-tzimmermann@suse.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Mar 2023 22:53:02 +0100
Message-ID: <CAFBinCCV4yu1HszSaCJuNVMhDC35hA8cpzLMw1x=a3x+LNYrEw@mail.gmail.com>
Subject: Re: [PATCH 11/22] drm/meson: Use GEM DMA fbdev emulation
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
Cc: linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, edmund.j.dea@intel.com, alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, anitha.chrisanthus@intel.com, festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, samuel@sholland.org, airlied@gmail.com, javierm@redhat.com, jernej.skrabec@gmail.com, linux-imx@nxp.com, alain.volmat@foss.st.com, linux-sunxi@lists.linux.dev, p.zabel@pengutronix.de, daniel@ffwll.ch, raphael.gallais-pou@foss.st.com, s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, laurentiu.palcu@oss.nxp.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, hyun.kwon@xilinx.com, tomba@kernel.org, jyri.sarha@iki.fi, yannick.fertre@foss.st.com, philippe.cornu@foss.st.com, kernel@pengutronix.de, khilman@baylibre.com, shawnguo@kernel.org, l.stach@pengutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Mar 1, 2023 at 4:31=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
