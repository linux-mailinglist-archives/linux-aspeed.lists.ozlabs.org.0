Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6C16B841A
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 22:40:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb97L4Jcyz3c79
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Mar 2023 08:40:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K2pXxPF4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K2pXxPF4;
	dkim-atps=neutral
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb97B5d4bz3bVP
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Mar 2023 08:40:22 +1100 (AEDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-54184571389so118414307b3.4
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Mar 2023 14:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678743619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecgxfHAz/UBXIjhNVQyUFhEfo+f44kweGIvOpc2a+8o=;
        b=K2pXxPF4Q5NEb4aJh/ZtgOcay4z11aGdPJNGxoAyPpo5KHia65JmMJB5d/8Zuyw+mk
         tdCZvErxJ2+Ov6F3uwE0QJROGtFxcgLs87rRt5F0kxCCgObLtL179NI1TBOK9gGgGNJF
         Eh1qJPWmBakRFt6FaPcxyZurn1mCFc0uppN0BduNDbYkQ+cupOSDrFYHqqBB3+fKZKrd
         MbQHQFxJIAhFilhE19dQAn6Hs0OfHLcEq+ul1IX3tDPWqnP0oSGLzgbn7d3SK+ZP02oo
         r6ydpI+oGA5J1HikH4j8Apu5N/h8d3h2Vnb/H9bp2xjP5xBYwfX+xhPNTLVqo8zyv8em
         5+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678743619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecgxfHAz/UBXIjhNVQyUFhEfo+f44kweGIvOpc2a+8o=;
        b=JrXRor3Y8296+u5eN8oUN5l6KKHE+4TzYWBanP+eQoZcg07x7FJbkm95y15DZvJFJi
         FMMGzfP+4iR3P9THlvA/1jLt9WTMdJawTv9bsf3f4YhXTrghuYda/W1ZqQMDND06wHuh
         HIJjos36JHLycAldoF3kygZWAvoPQP0VWteQKz0GtDUrrYlWhwPEZTNfgA4PRma/rRRy
         +M9A0WzvLBskJzA0j87CQBAGLJh/ZorucjDnzeW8G+unHpdEvbXv1beP24Ztks8zBUou
         egZAgL1y+DZbu3+4CVyE5Aam6rkfs0e9j7j2bUCNLON/28+OQ2ULkt6czGzo5Y3P7jsg
         vt2g==
X-Gm-Message-State: AO0yUKVZ2uHRyNqgPSi1I4Mvz+aYEFlt9T1M6kfxwt1v+/THeJJF0xi5
	ac9w1XIve8zp7X3kt+UBlUyK8VNE1xi9n7r19qIZbA==
X-Google-Smtp-Source: AK7set8MXe6q7JAQYwdFRB8ZhsrrhbkSYB8JcvLg20wPqKZq56TZe41RwUBKjK5hxxwd+ByFitU1csO05sXE3FhMJro=
X-Received: by 2002:a81:af1f:0:b0:536:4ad1:f71 with SMTP id
 n31-20020a81af1f000000b005364ad10f71mr22810681ywh.9.1678743619469; Mon, 13
 Mar 2023 14:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230313155138.20584-1-tzimmermann@suse.de> <20230313155138.20584-25-tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-25-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:40:07 +0100
Message-ID: <CACRpkdZLFuGdSqnDYXnoWEjnVmumT23Rz4Y9QT9-9=Uoj5PUpQ@mail.gmail.com>
Subject: Re: [PATCH v2 24/25] drm/mcde: Use GEM DMA fbdev emulation
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
Cc: linux-aspeed@lists.ozlabs.org, maarten.lankhorst@linux.intel.com, javierm@redhat.com, mripard@kernel.org, linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org, daniel@ffwll.ch, linux-amlogic@lists.infradead.org, airlied@gmail.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Mar 13, 2023 at 4:51=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Reported-by: Linus Walleij <linus.walleij@linaro.org>
> Link: https://lore.kernel.org/dri-devel/CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUy=
wxkdszpTC-a_uZA+tQ@mail.gmail.com/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
