Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BD66B841D
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 22:41:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb9912ZL8z3bdV
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Mar 2023 08:41:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=obeFtHVs;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=obeFtHVs;
	dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb98v4jV7z3bW0
	for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Mar 2023 08:41:50 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id v196so6122629ybe.9
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Mar 2023 14:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678743706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aln1hEdgcCcgANtA4QqHK4LEQZjmm0gs9rDgqPgUYnk=;
        b=obeFtHVsVUapqop3MZKJozH3FqvKkagKehW9wH8Kk5Z2q53GUYuOTYQwDJfe0rD8GW
         VpTxDa9EKaUb3LWfiQoMqGQSCyEpNI4+b7GzmK3XkQWXoUv7H4WEm+kgX282GUGaLcRR
         oGw49ywWS7ZvrQu5Q27+vM/J3wsgjMJyc2aw94wUqS/O+xhj7nfPqMcBIzeH6DX+m0Tu
         U9ONMmuiYC1sfpAyBk/IEs7gHez697aQhir78i9oLtd/P/vN7M2cqeAND8s7hBro5uge
         sz8dQISn4LMWOjeQoS+p40Jax/AQFpfz+RS+w4EF14NUdwHYe3NrEHORt1Qkv0DcvvHm
         AErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678743706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aln1hEdgcCcgANtA4QqHK4LEQZjmm0gs9rDgqPgUYnk=;
        b=hvi2/GrpNi/AdzimkcDzlajBMvPNMNOXDOGSIIqZa+Rhxzu1MCWtioUoeLvnFmFVNv
         Lz6hSi3pYfIfFaRflkaN4ugzi/c1Mtz6nlLXON5j8tbpPTR2ERjR0H44O4rLUs5aGLCN
         ZTw1wq+iXDZ5hguDy+pqFIAtyX8KYZAKoUsTbVf7o6TN9MV6BY++E4RPRsLYqMSqR8NV
         gHWzUliEtecs7GSMFy45Mms4Ozwd6HyAdJRjyY3zp4QAPc1/GZv4u6UD7D4BoehdxHoD
         e5dzlv9RN+y49M6R9h2Hs8PLpDuAhz8RNJhhSC+1jI21GJ4pmFEEx4ZcDdNRvaw272jd
         1qPA==
X-Gm-Message-State: AO0yUKVWY4ArJ9PEvct93VRiynLP91uXISndkuBmWOePyMcCIG16w3PB
	XPftXoJgFaxSbO3/00V0oYKo7n2aG9S05ALoSDgYVw==
X-Google-Smtp-Source: AK7set+R+YI9Nnas+5qiv6+jEi0Hs0zRL5Bqz75GQxapnR9lrv+JhLm/gXYEZWElQkVJe81BR8KBAxDNduDAH7eUSZY=
X-Received: by 2002:a5b:c48:0:b0:b1a:64ba:9cac with SMTP id
 d8-20020a5b0c48000000b00b1a64ba9cacmr3361726ybr.4.1678743706748; Mon, 13 Mar
 2023 14:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230313155138.20584-1-tzimmermann@suse.de> <20230313155138.20584-26-tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-26-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:41:34 +0100
Message-ID: <CACRpkdYDpvpvURPCsdAMEd6s4_uU3UCpWoVLYkM8jh+wBM0ACg@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] drm/pl111: Use GEM DMA fbdev emulation
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

Yours,
Linus Walleij
