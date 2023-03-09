Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 927556B22F0
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:27:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRk62rBJz3cMN
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:27:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tg8tHneV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tg8tHneV;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tg8tHneV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tg8tHneV;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRk15nJvz2yPY
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:27:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Tg8tHneVRsd+W+BnvY/VHtX2lYyoBX4SgPnIf5W+ECT9GcrnsskFJ2yQCAdIIkdfKFeePc
	yReHFHMgEc4RIIHK89iYO4oR1/QeiVL4FPcQL34cpySYL8glQGD7a1aq3FlyFZeT+zOYcc
	y4n28h6SrRTOqcObSbTHR3aFl7991xM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Tg8tHneVRsd+W+BnvY/VHtX2lYyoBX4SgPnIf5W+ECT9GcrnsskFJ2yQCAdIIkdfKFeePc
	yReHFHMgEc4RIIHK89iYO4oR1/QeiVL4FPcQL34cpySYL8glQGD7a1aq3FlyFZeT+zOYcc
	y4n28h6SrRTOqcObSbTHR3aFl7991xM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-UFx1J1WmNhOlJQiFMjxWFQ-1; Thu, 09 Mar 2023 06:27:34 -0500
X-MC-Unique: UFx1J1WmNhOlJQiFMjxWFQ-1
Received: by mail-wm1-f70.google.com with SMTP id k20-20020a05600c1c9400b003e2249bd2b4so544368wms.5
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361253;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=eIsZoKBUPUpyvsdhNkQP+TYrSDWq85/1phG4h+MXcf8cK0As5xDtuAEqAWXL1Xj+60
         iF70GQh9DjZT+0jEM1pZNkaqJkWYbGju/JI68uRSmiqtawmz8i8KQrcg1yTix/pB1c31
         yKRO26ci945HZM930o2E4wZfvP7FHFMsuL2XE7q2WhuyQobRMw5FmqnCLd6sT6aSoIyE
         E8CLZ499f1fi2t8FhgCTgqYyBfftJXhmTNe+eFFHqn8rxZ14wsmM6wLci9rlgRseDzB7
         3/nzVF8IQjmlKUGSfA/B6m7Orfo7fYYuzghzTaJxsCgGgWGGGWYi13U16otSgg4VlRs9
         hUhA==
X-Gm-Message-State: AO0yUKXdGqaY+XZWT0TcLFdo71FMiVqApL9mBMvwWUAv5kiDQ8+kVwZ6
	a2apBbE4d9wrQw+MTdxdYkFZa2aBuMuuHX4vva1SEsHwPPCh/VRPQ32rYJ8zEqFhpLgxwOKilGo
	B5o88ox0sFKAL7JsZM2U+FxzcAw==
X-Received: by 2002:a05:600c:1d16:b0:3df:9858:c030 with SMTP id l22-20020a05600c1d1600b003df9858c030mr18329010wms.5.1678361253090;
        Thu, 09 Mar 2023 03:27:33 -0800 (PST)
X-Google-Smtp-Source: AK7set9NkiNNv96tpY+ICOstwyMw+enkMfLxXSTreTdhPg1jdkeOeFAU5LDWK20u9ucio+cg3Xhjrg==
X-Received: by 2002:a05:600c:1d16:b0:3df:9858:c030 with SMTP id l22-20020a05600c1d1600b003df9858c030mr18328975wms.5.1678361252754;
        Thu, 09 Mar 2023 03:27:32 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l6-20020a1c7906000000b003e2052bad94sm2217733wme.33.2023.03.09.03.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:27:32 -0800 (PST)
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
Subject: Re: [PATCH 18/22] drm/tilcdc: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-19-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-19-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:27:31 +0100
Message-ID: <87h6uu6u70.fsf@minerva.mail-host-address-is-not-set>
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

