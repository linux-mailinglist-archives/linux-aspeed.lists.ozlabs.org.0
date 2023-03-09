Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E164F6B2302
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:29:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRlt5pwRz3ccr
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:29:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GwcBUxVB;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GwcBUxVB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GwcBUxVB;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GwcBUxVB;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRln3Tztz3bhx
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:29:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=GwcBUxVB+lcW/SEYDIvZBUIgdsMu4u6EixY/rjJ9d3AJb6JkeOwrV8LUmZzfgVc6EDO0Ep
	P2YFbSIO0gifQl3we+FABKfRpPmerO9PTAic5dciOVqkjKzM/fbk/KYFTizHiBSMo6kcpS
	RYyj+W2LOpsVhdeXtR9TfIRdMbFgEyg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=GwcBUxVB+lcW/SEYDIvZBUIgdsMu4u6EixY/rjJ9d3AJb6JkeOwrV8LUmZzfgVc6EDO0Ep
	P2YFbSIO0gifQl3we+FABKfRpPmerO9PTAic5dciOVqkjKzM/fbk/KYFTizHiBSMo6kcpS
	RYyj+W2LOpsVhdeXtR9TfIRdMbFgEyg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-CVwJvbjtMIKX20epUqIg3A-1; Thu, 09 Mar 2023 06:29:05 -0500
X-MC-Unique: CVwJvbjtMIKX20epUqIg3A-1
Received: by mail-wr1-f70.google.com with SMTP id l5-20020a5d6745000000b002c91cb49949so350030wrw.14
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361344;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=clJyQVgGYumia1M/HvZ64wWhBhqtYO/eA2+o9K8b5eo0dQ6LVKKY5NsVxa6rVr9LfQ
         1xd6AnMV7k3VNmpNYjNeL1fFB9Stl33a8OrQyuKewDXR9xXRtt59Lzk+wmUFIgGuI6s5
         jrMQJrgvCLqb+v8rM1q0xCfBko8hZpAxQBVT6ZgDRaMmjN8LwKyxUXsFDOxSw2kqxJfJ
         gRBPi2GrxJ0AAFV3v2gWxcLlFEGgFDxhWTgscyj3wb/xcHNhTtqbngiU0Vc4ImuKSIE7
         Wde/DPOE0gdfMkGoczgQpWhimgZx2Gabd4jRDa9O3PzwsTFA5Gt1DvB9yAbK0VruLSZQ
         5XvQ==
X-Gm-Message-State: AO0yUKXo+cYbYEwRAGDX2STqRUTHsZvSqiI2hrP/ZsFz5lZ66F5W2L6p
	KjmCHjeUiXENA1VVIKxJbXRMrfJ9IDvnvdcMDPkvs7GWka/T86OE18FdZEBFpDujESX7SDi5tSx
	iyIr5fj3HtL15mRuYoKOTEWfR1Q==
X-Received: by 2002:a5d:6505:0:b0:2c6:e682:e55b with SMTP id x5-20020a5d6505000000b002c6e682e55bmr11934465wru.48.1678361344741;
        Thu, 09 Mar 2023 03:29:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/SuOlGzNjzuB+/71QhRoDFVzQZ5KDl1yemHeUwxjB4OayINr1XWjAGx9mSH74oqRW7vJe0XA==
X-Received: by 2002:a5d:6505:0:b0:2c6:e682:e55b with SMTP id x5-20020a5d6505000000b002c6e682e55bmr11934447wru.48.1678361344548;
        Thu, 09 Mar 2023 03:29:04 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bg2-20020a05600c3c8200b003e214803343sm2615371wmb.46.2023.03.09.03.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:29:04 -0800 (PST)
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
Subject: Re: [PATCH 22/22] drm/xlnx: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-23-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-23-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:29:03 +0100
Message-ID: <875yba6u4g.fsf@minerva.mail-host-address-is-not-set>
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

