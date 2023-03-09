Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 559DF6B22E4
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:27:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRjP1dtlz3cXf
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:27:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d0N6c/Uw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d0N6c/Uw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d0N6c/Uw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d0N6c/Uw;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRjH4JCkz3cNM
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:26:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=d0N6c/UwBgEz/bFY0nRuZ9Q8tZF9SdSHeNfw6HgDIBTVHGMidBjSuCms2/LH9vuR3KDO9p
	+Biqhn7k0D+f6ZjZedwhc6sRNhOCyoPh3UiaUhRQjJsl5QDryS5DAR6dHKO3EOJs2oPIyg
	ZGaRkmXIz6U5lVwolcKnyWgVT6X0zY0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=d0N6c/UwBgEz/bFY0nRuZ9Q8tZF9SdSHeNfw6HgDIBTVHGMidBjSuCms2/LH9vuR3KDO9p
	+Biqhn7k0D+f6ZjZedwhc6sRNhOCyoPh3UiaUhRQjJsl5QDryS5DAR6dHKO3EOJs2oPIyg
	ZGaRkmXIz6U5lVwolcKnyWgVT6X0zY0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-lxMpcwdvOg-N_-lFOjN5Rw-1; Thu, 09 Mar 2023 06:26:56 -0500
X-MC-Unique: lxMpcwdvOg-N_-lFOjN5Rw-1
Received: by mail-wm1-f72.google.com with SMTP id l20-20020a05600c1d1400b003e10d3e1c23so2261367wms.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361215;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=VqHfjq97pvuhKCKaaJhQ10z5HId8i0H2WKYQ8F9rAyPiLlY1yegvjboO4sxiPEnGmc
         L1Kn8TGs3h02CxH7qlardUP4eLuh2kf5WbUAkRDGs/Qa2mpQZNCX8QaMNVtmGXoDufk3
         m7uoqgOZ5DJ2w/po+24EL1avp6yj6nzjqSTF+ialHSmiEIuDgkOMVYvxrslGXhAuplSj
         9vdkA/lDYPOXKla4U2OfEOOJwrSGJk6j6KY0xovmm0gZm3YIYg6zR+bArQCO9uf8IMEf
         yXTzznupGRzv7B5kgx1ZFNk42sY+uv8LvTM5gXPXwzVPzjMQ9mFjlgisf0+a05F4a/27
         bYcA==
X-Gm-Message-State: AO0yUKU4SwSNCEQsWOimfXrbL7Fhaa7Rvn0dolmcAy9zUw2A9aDwBco5
	MvlwZ3P9BLoJXazf3C4OS9jx5DpM55KdA4I6VdrkSezpJJ+dCLv9R+jpiyBBoOs6wWII0eyIXnG
	edvZcCvLO/2i2lJ69tuagmzx15A==
X-Received: by 2002:a05:600c:19d2:b0:3e7:95ba:e1c7 with SMTP id u18-20020a05600c19d200b003e795bae1c7mr19013907wmq.32.1678361214953;
        Thu, 09 Mar 2023 03:26:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+ootXMCqEk3gOIZKrqE6NGC6vCRZefQop/jJ1mx2KmfjNSeFee8+geTPWhVxDzmhIrEN6nCQ==
X-Received: by 2002:a05:600c:19d2:b0:3e7:95ba:e1c7 with SMTP id u18-20020a05600c19d200b003e795bae1c7mr19013869wmq.32.1678361214645;
        Thu, 09 Mar 2023 03:26:54 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c230500b003db01178b62sm2249369wmo.40.2023.03.09.03.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:26:54 -0800 (PST)
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
Subject: Re: [PATCH 16/22] drm/sun4i: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-17-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-17-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:26:53 +0100
Message-ID: <87mt4m6u82.fsf@minerva.mail-host-address-is-not-set>
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

