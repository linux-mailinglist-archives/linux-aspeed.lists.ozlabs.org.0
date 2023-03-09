Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D806B22A6
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:21:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRZg4QWrz3cTk
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:21:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DxHnWUYB;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DxHnWUYB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DxHnWUYB;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DxHnWUYB;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRZZ09DYz3bhx
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:21:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=DxHnWUYBvv7AuuzG2NLSFvqNvImphyZ1qpk1y+QZQJY0eRcWj7f7NZkvvepbq0VgGf6Y8T
	q9fmScCxMxRKiYtgj2+ylehI9PNo6FOnbTv6zDOoZxWFE+IPauDtca+0HmBKKXeJLD0zee
	gMUbLpXDg5sqby36mj56f+Eo063l/2g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=DxHnWUYBvv7AuuzG2NLSFvqNvImphyZ1qpk1y+QZQJY0eRcWj7f7NZkvvepbq0VgGf6Y8T
	q9fmScCxMxRKiYtgj2+ylehI9PNo6FOnbTv6zDOoZxWFE+IPauDtca+0HmBKKXeJLD0zee
	gMUbLpXDg5sqby36mj56f+Eo063l/2g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-pNes8EDHO4yK0wmzSk2L7A-1; Thu, 09 Mar 2023 06:21:06 -0500
X-MC-Unique: pNes8EDHO4yK0wmzSk2L7A-1
Received: by mail-wm1-f70.google.com with SMTP id az39-20020a05600c602700b003e97eb80524so2248894wmb.4
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360865;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=H16O47dyXodthZBMTJksr32UKGgf+zObidhpvKloZQrWelOKFtMoSK/8f+Hmmf+M0w
         hM23DByc5js0qcoRVnT6ppTTx+ENgZ5Lgilrytdc0vy/Y9G8DqNL9PuMS6O69+tSqS+D
         aZ/cTGROHeYGVMc731vOhDYPfgv4cXiqnIeCOD2FuD0Dimpfm5MAlMJ7/P+6JjHftfdw
         Y1EIjRevpDh6zEBCvu7XY5IEBScoPqeeT1FQ6wlJ++OJt3Q/Z5BW2XJe6+PNDrW/4hKQ
         SuleXEUq9a3NcbKVNl8xWoOdwlfk3MwFPmsTKtgmmtFP+5QnePQP485bNRasfgtUXWBa
         RY/A==
X-Gm-Message-State: AO0yUKWIzXaHjVP/Nk54QlIztlZLvjR6FqgxfjVPodHTZj9DSyXV7fk8
	Hu5PRRE4ova82Rbyl1jvIsf4O0FWosE0e66OWwUi+MKP9XIS8nNd1I4vLevCNFGI45BZXJrYmjr
	8cubQkpvXHfvDb02WMCqEK+ksdg==
X-Received: by 2002:a05:600c:3506:b0:3ea:f6c4:5f26 with SMTP id h6-20020a05600c350600b003eaf6c45f26mr18534968wmq.17.1678360860414;
        Thu, 09 Mar 2023 03:21:00 -0800 (PST)
X-Google-Smtp-Source: AK7set8sLO5bKSPBoOiZMye1ieYHzGLgjQdrxGWGVp5ppUvSkKaG+jgho1T4oKqlnOH+WRjzqLQwTQ==
X-Received: by 2002:a05:600c:3506:b0:3ea:f6c4:5f26 with SMTP id h6-20020a05600c350600b003eaf6c45f26mr18534954wmq.17.1678360860177;
        Thu, 09 Mar 2023 03:21:00 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m8-20020a05600c3b0800b003eae73ee4a1sm2681759wms.17.2023.03.09.03.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:21:00 -0800 (PST)
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
Subject: Re: [PATCH 07/22] drm/imx/dcss: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-8-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-8-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:59 +0100
Message-ID: <87jzzqcgro.fsf@minerva.mail-host-address-is-not-set>
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

