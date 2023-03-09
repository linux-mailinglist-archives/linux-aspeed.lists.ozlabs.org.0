Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F338D6B22AE
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:21:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRbS4lwKz3brQ
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:21:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mb36jRGu;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mb36jRGu;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mb36jRGu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mb36jRGu;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRbL73k4z3bfw
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:21:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Mb36jRGuC/o/ac716W/VeetYSkISJ0LRdvXaBeIiBaVoNmsX6X+1EXv9Vv8dRfo7eIIqmr
	KCVCseyRgCwqi3mrqn1fC/DOx+7n1PZNw3SuQdEC5JebE7zc2P3gmXQekVmbm3dboIqpkE
	OQZbsLPkY7e6Faa6Q/GSAx3c9kKygxo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Mb36jRGuC/o/ac716W/VeetYSkISJ0LRdvXaBeIiBaVoNmsX6X+1EXv9Vv8dRfo7eIIqmr
	KCVCseyRgCwqi3mrqn1fC/DOx+7n1PZNw3SuQdEC5JebE7zc2P3gmXQekVmbm3dboIqpkE
	OQZbsLPkY7e6Faa6Q/GSAx3c9kKygxo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-9nTZymV_NSWs2xjzEDnijg-1; Thu, 09 Mar 2023 06:21:46 -0500
X-MC-Unique: 9nTZymV_NSWs2xjzEDnijg-1
Received: by mail-wm1-f71.google.com with SMTP id u19-20020a05600c00d300b003eb24ce58ceso538671wmm.9
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360905;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=OZRFYZb/t34PgiY9sy73802yo5FoclGaKA48yU4ch3KM1AIxO3PrYG9HIMnDZbY/z8
         GUmDSMVSu0P7dbJ2thr0mkcn7fcPkTu4b8/q805J4CnmaNGC+26qcOO8VEIf48Wny2FJ
         4OC5bKZ38mwqdx2Fj2dhwZLGnakjfVojMbxDc59jNI7XIwHkAJjEc4fqagDc9XUb30ix
         AUR13wFg9JpjJIw6+7FHnWbheULEhWJlv+Vxj53/07D1xR0Egee2mDqlW82E/DBB2mZ4
         l+oHWrJ7WZLfGRacMfh5csSp91eDuG9+Ge38VHUBANX6dWHB4r89bdumQs+1RYF8a1Ws
         mLMw==
X-Gm-Message-State: AO0yUKUSE4c2AFDm9KjSshk3szKB5OdiTMbAIiVE9T6eQ5PYPjYqwuXc
	5AAZhCawg2JgF8noc7iRQPwrkLbD4tvbYF3NtD1rZiew4vlqUOCJl2uk/HpVJtduIIYsRB70FyL
	8eG6O55tHHf/ZPhrkqYsv/zYMgg==
X-Received: by 2002:adf:da47:0:b0:2c9:f488:5f54 with SMTP id r7-20020adfda47000000b002c9f4885f54mr12321081wrl.57.1678360905540;
        Thu, 09 Mar 2023 03:21:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/T4C0dgvSGGMpJs8/32CGlr56CYDRn+YAtD8UDvYRDVE6ywdBnZAiSainv+9e2TUJLz767pg==
X-Received: by 2002:adf:da47:0:b0:2c9:f488:5f54 with SMTP id r7-20020adfda47000000b002c9f4885f54mr12321033wrl.57.1678360905258;
        Thu, 09 Mar 2023 03:21:45 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id d1-20020a5d4f81000000b002c54e26bca5sm17503473wru.49.2023.03.09.03.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:21:45 -0800 (PST)
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
Subject: Re: [PATCH 09/22] drm/kmb: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-10-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-10-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:21:44 +0100
Message-ID: <87edpycgqf.fsf@minerva.mail-host-address-is-not-set>
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

