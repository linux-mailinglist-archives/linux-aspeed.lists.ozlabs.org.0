Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BDD6B22BB
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:22:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRcY6TG4z3cMf
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:22:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dghzts1K;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Oya0hGg3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dghzts1K;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Oya0hGg3;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRcS4vwJz3bhx
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:22:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Dghzts1KQfEJn117b+D+nIsLd5JNUVZxacPTW+thvMS+bZCpeL/Kk2LnfiNO0OdOJkbCcH
	KCkYj3L2d/LUOtcMjAksgiA0glofBTMHqnuDJJl0yMuBSOMTLihGq600Hg5GH6mUHvqxk1
	T5lDDvYaievRtWIJpsuOV51mH2r7Gps=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Oya0hGg3+X0k6qqLNpQHxAHrAJr75e8irdQErkO238x02Gkop5Oe8t3j2Mzilf4W7sR7ak
	1zR2KCw0KOsLhvyFry/R5dvIF26hD7LHJZpWNFpIR/4JGG7B2Cj/eVTJHecXCm7eoiAXiF
	tHJN+ob0D0O6qDE26QF3APZaRIjkZcE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-GEnbuhGnNOmDMncMtO6tpg-1; Thu, 09 Mar 2023 06:22:44 -0500
X-MC-Unique: GEnbuhGnNOmDMncMtO6tpg-1
Received: by mail-wm1-f72.google.com with SMTP id l20-20020a05600c1d1400b003e10d3e1c23so2257264wms.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360963;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=OwpLViOLr0iVm+1yUriERdNmdQoL6uPWu2F0q4lJCUGi3cbEvVtYj/nM5Ut9OBx/UX
         v7SaV/4f1BPbVPbO7v2MFm+sng0h5hggLsQMN7+PyK/HOVwyhpt2wfVLzvM94cTI1T25
         SwjN9EAl7Sp6DcAFGsS/1gpGzwntHM0JrqnX0JLRpPI9GgtrfCtE4BCaZvXCLzpKKdYE
         LnpIasO73cisozLmx5z/BJdkGchOohmRA2K9Priwm7FCGNyt9hosorkloBNZgq9OK+lM
         nvp0Wwl/tqG0n+8wGeJPBg275gS35fnfeREDU4Q528+BLjOwyzVytgKJhdCNs0frkkqb
         q/Rw==
X-Gm-Message-State: AO0yUKVrWRUekanu17t8R8JJgEEoXxhsazI9B206UFqrqLKpLHFQqyUN
	kxNvGQCuv3cSsVruI4MpeoqPkyyCvyrvc9wFexZYt6eXijU/cRfLjEZJVG3H9fWfrvrVYmnlBdI
	XQEr8zNh5f0lBIMQEQ0iEdbyigQ==
X-Received: by 2002:a05:600c:1c05:b0:3eb:4501:6c60 with SMTP id j5-20020a05600c1c0500b003eb45016c60mr15506198wms.5.1678360963370;
        Thu, 09 Mar 2023 03:22:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+bXzeTIl7Irwfxa7/DXky+Tf4Fs2Oix8AFpHgk72LnoLDINFW1m3YZeFk72iyLEtfOHY0o9w==
X-Received: by 2002:a05:600c:1c05:b0:3eb:4501:6c60 with SMTP id j5-20020a05600c1c0500b003eb45016c60mr15506159wms.5.1678360963195;
        Thu, 09 Mar 2023 03:22:43 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b003eb966d39desm2539921wmo.2.2023.03.09.03.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:22:42 -0800 (PST)
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
Subject: Re: [PATCH 11/22] drm/meson: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-12-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-12-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:22:42 +0100
Message-ID: <878rg6cgot.fsf@minerva.mail-host-address-is-not-set>
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

