Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6946B22CE
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:26:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRh95CM0z3brQ
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:26:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G2zxcM5X;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G2zxcM5X;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G2zxcM5X;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G2zxcM5X;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRh43x6fz2yPY
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:25:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=G2zxcM5XFvPOogQgAGhDYLPFj6iK2DQb/QIqJxf2mAsgto0qflhs0OoQ0IXuT/oLwOIPUt
	1bAsgPyflJLaEkqonW6oY7WfG/sL6b87tQh5XOm6ZG1u5QjUopYqJCJDkbc6w6jH/rh2KN
	o9UYHuz23jYsj4eC4+yq//yWych3usE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=G2zxcM5XFvPOogQgAGhDYLPFj6iK2DQb/QIqJxf2mAsgto0qflhs0OoQ0IXuT/oLwOIPUt
	1bAsgPyflJLaEkqonW6oY7WfG/sL6b87tQh5XOm6ZG1u5QjUopYqJCJDkbc6w6jH/rh2KN
	o9UYHuz23jYsj4eC4+yq//yWych3usE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-S3Z3Rfq4NGiyeXWRFsPaLg-1; Thu, 09 Mar 2023 06:25:52 -0500
X-MC-Unique: S3Z3Rfq4NGiyeXWRFsPaLg-1
Received: by mail-wm1-f71.google.com with SMTP id n15-20020a05600c500f00b003dd07ce79c8so660238wmr.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361151;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=fIgHHMGQUM8uhPgHzJW+NxyYa7XhpoFDcgg7az1LOURXQ0KANACkB6bfH36RLUtzAB
         5NjXxoM2jJfRA2vfl6gKZw1U48N2Ti1h4EGmXp3omFqroo1pUQNdu/trj9yiTFuMq/jI
         HDDxwm76lHmJIYmYRO+Gnn7cnz1hLSBB3trlqfXNKqrt+yMOZXKBi9N+LZcuLNOTxgOI
         n8qZuhnPLTAFQIaRIukzVy882wQmcdyzP2nGxwC5xdCGsfdBsGuanWVrPjdAONxRvPLc
         id7MJa3j8EVncxAbSY3+4qGmLkX09y6ya7D1DjfqoIEwgH+ufnuWe2Q6Ivn7tRsBU3n4
         wH/A==
X-Gm-Message-State: AO0yUKXXpN5KFGpV4S7vPpv/Nf4GRH6LpbHXYcJEWMUFlOeRfFTVXO5m
	svo625aP5b3AnUcIC65daRe5DlvkTb2StpUJP/4d021BTkQJvRrAkev9TWR8sGgFfvNW8mApaJB
	fislaRX/DVpMQTd+/m3IxTwer5Q==
X-Received: by 2002:a05:6000:1a54:b0:2ca:6cb1:c9c5 with SMTP id t20-20020a0560001a5400b002ca6cb1c9c5mr14672887wry.30.1678361151280;
        Thu, 09 Mar 2023 03:25:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+fKWERQDzcgswyQf9IdMUANe41W2TE3VA84WcXGdem8/aR/1UT8t++iE4upU8MSOqw2VB+mg==
X-Received: by 2002:a05:6000:1a54:b0:2ca:6cb1:c9c5 with SMTP id t20-20020a0560001a5400b002ca6cb1c9c5mr14672854wry.30.1678361151005;
        Thu, 09 Mar 2023 03:25:51 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b3-20020a5d40c3000000b002ce37d2464csm13808052wrq.83.2023.03.09.03.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:25:50 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, andrew@aj.id.au, laurentiu.palcu@oss.nxp.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 p.zabel@pengutronix.de, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, jyri.sarha@iki.fi, tomba@kernel.org,
 linus.walleij@linaro.org, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 13/22] drm/mxsfb: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-14-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-14-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:25:50 +0100
Message-ID: <87v8ja6u9t.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

