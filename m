Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9259928872E
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 12:46:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C74Vp0jF3zDqcQ
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 21:46:10 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nN/VctAK; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C74Vb4pKqzDqbk
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Oct 2020 21:45:59 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id c2so10021338qkf.10
 for <linux-aspeed@lists.ozlabs.org>; Fri, 09 Oct 2020 03:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q0cpbEKjtPzaJVoOgW0q6Pj3F3Hj420G4Ch7pN255UI=;
 b=nN/VctAKgvn6QJ82Y6bjLI4df8yDsvTfqOnOM+4ETQA2M/L0Ldr3GX3k55RSqOxMmr
 CkN4Qm5IMTkwuOinsnEV0BccIWhk3azI78htl98ZRhkt5tOYiGwK22rEmhVorM54gE79
 ipSpwAq/vYiJb/Us3YvJehJRwpYd1kMRNqmlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q0cpbEKjtPzaJVoOgW0q6Pj3F3Hj420G4Ch7pN255UI=;
 b=XpWGZ5rdzwWKUC+KqeTfXPzTT1GIai88hdQahmtDUxJZyYaSaegMCJxgHHsdtRojzx
 nZBEWrWe/eBb19Y55B/EM0gs6tsTeBSV/8+CIpAlmrpJaCdQd6x7nnlg5bHbaJhfcdOx
 jEpPEMJwrQ4r4oRXIY56aRzcZhk/5VZc5cahKmqj6c+Ket36qr/2IhD3qBnehPBtuOm8
 5GxnRdGp3Sxio9m3J73DuIpCb4yj0w2mMZ8le9kj7/lsDH5clY1V+bCMpdKvjKYyD5aQ
 cD6+F45DblYgte+OeYm01rDoNXArcMdk6opUWF359GnxhDbh1e7V68Oyp1EeBzBklTNq
 oSmQ==
X-Gm-Message-State: AOAM532YrcyzIQy4WV3RIon3LMEuhO7mX5Deuwl8y6Gm6yOEsWJEW+AZ
 771/DqNVaoj7Wy8Tg9qqQ3qTfSjgQ09gbP02bmg=
X-Google-Smtp-Source: ABdhPJyvdE6tI1tTHbfd7fiFrWmE4zGGdV2gGWypmdymp14fSM3pa8TxlB/nwYthfgW4nLIu2XWfaLZCMIamivNfHGY=
X-Received: by 2002:a05:620a:16aa:: with SMTP id
 s10mr6790978qkj.273.1602240354758; 
 Fri, 09 Oct 2020 03:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-5-tzimmermann@suse.de>
 <CACPK8XcGOAjocCMp9ubgQpfiBaqSj61i_frSU7ZdiKO_uSt-hQ@mail.gmail.com>
 <3df12a74-d8f3-d607-78ff-5a0f21e86cb9@suse.de>
 <CACPK8XcAXrf6ySuWo4izjD4EU6tMSULs0tP4cy-+TA35PSOUgw@mail.gmail.com>
 <c3419660-770c-dadd-21bd-9a6dc0e10a8d@suse.de>
In-Reply-To: <c3419660-770c-dadd-21bd-9a6dc0e10a8d@suse.de>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Oct 2020 10:45:42 +0000
Message-ID: <CACPK8Xfx=tip4Xuqdo15P7R2cXSEXPr+LuED8ZJS5tQui+rjvg@mail.gmail.com>
Subject: Re: [PATCH 04/21] drm/aspeed: Set driver CMA functions with
 DRM_GEM_CMA_DRIVER_OPS
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, narmstrong@baylibre.com,
 David Airlie <airlied@linux.ie>, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 paul@crapouillou.net, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 mihail.atanassov@arm.com, Sam Ravnborg <sam@ravnborg.org>,
 Marek Vasut <marex@denx.de>, Kevin Hilman <khilman@baylibre.com>,
 abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com, xinliang.liu@linaro.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, NXP Linux Team <linux-imx@nxp.com>,
 alexandre.torgue@st.com, puck.chen@hisilicon.com,
 Sascha Hauer <s.hauer@pengutronix.de>, alison.wang@nxp.com, jsarha@ti.com,
 Chen-Yu Tsai <wens@csie.org>, vincent.abriou@st.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, philippe.cornu@st.com,
 yannick.fertre@st.com, kieran.bingham+renesas@ideasonboard.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, zourongrong@gmail.com,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 9 Oct 2020 at 08:26, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 09.10.20 um 10:06 schrieb Joel Stanley:
> > On Fri, 9 Oct 2020 at 08:01, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >> Hi
> >>
> >> Am 09.10.20 um 09:54 schrieb Joel Stanley:
> >>> On Fri, 22 May 2020 at 13:52, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>>>
> >>>> DRM_GEM_CMA_DRIVER_OPS sets the functions in struct drm_driver
> >>>> to their defaults. No functional changes are made.
> >>>>
> >>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>
> >>> I just found this in my inbox. I assume it has not been applied as you
> >>> were after a review.
> >>
> >> The patchset as a whole got an A-b and was merged a while ago.
> >
> > I'm a bit confused, I couldn't see it in any tree. The aspeed one
> > seemed to have been skipped when applying the series.
> >
> > I looked at today's linux-next and drm-misc-next.
>
> Indeed. The other patches are in drm-misc-next, but not this one. I must
> have lost it during the merge process.
>
> >
> >>>
> >>> Reviewed-by: Joel Stanley <joel@jms.id.au>
> >>
> >> Nevertheless thanks for taking a look at the patch.
> >>
> >> Best regards
> >> Thomas
> >>
> >>>
> >>> I will apply it to drm-misc-next.
>
> So please ahead and apply it. There's also an ack by Emil, which you may
> want to add as well.
>
>   Acked-by: Emil Velikov <emil.velikov@collabora.com>
>
> Sorry about missing the patch and thanks for taking care.

No problem. Thanks for the cleanup.

Cheers,

Joel
