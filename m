Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D61A86B2297
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:20:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRYT4lcrz3cd4
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:20:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SFZp/Og4;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LnU2x/Iq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SFZp/Og4;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LnU2x/Iq;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRYP3HRcz3bfw
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:20:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=SFZp/Og4GvnTEu2G65f1o9EoAFNv75FpzmUCue1CfPD1ONDU2GoXDqwFjHXEH49NuoWmO7
	167/uyGqnDuBrx9ar7A9B4zKPu12ZXEXDCUXXfcZn4hobPJwqZv8Bs9pQCyyZteKDwUMlg
	uu2Hi6mwYIKMJxFrs4GebxZrRcC1wHs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=LnU2x/IqqKCDqK4XrlpxL32vicetj9esoRSV22lHIzA5oy4CwYOc5AWayknS5AOPPfN+DS
	zmYkhO8Yd4FyyzPtYmWWd6Zy5Zj6yi9cYn4W8/y6Kr9+AA6Dyv2palO2TZx192DSVhktcy
	r/ryRouww/NiC16O8AAeT9zGoirO7dk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-GU3uxsPaN7WKyAWEfRaN-A-1; Thu, 09 Mar 2023 06:20:04 -0500
X-MC-Unique: GU3uxsPaN7WKyAWEfRaN-A-1
Received: by mail-wr1-f71.google.com with SMTP id u5-20020a5d6da5000000b002cd82373455so343583wrs.9
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360803;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=JVpgSElVXH82MivGc3fRvNg/cizp/v9OsKGdlvV7CETm8u4imn7Jjfv4ZCTX1ifRJE
         iUuru9WT0T+aASulpMKxm6BTZobcPRVnubenh/K53uXbU6Dt7d/TiBGtu6hMDwsrrRqs
         l54W0pQ8p9jIK18/cFHBAQJub4fTn7U7VONNs6oigLMJHBJfFwQwdfBNilTHfs+WE2hc
         sFuhyMfitiUUn3AckKD177kljv+gJp6pHusTYLxx9Hkn7YheqeYYFB3ee78GZ/mGKybU
         NbRnBoN/ihqVA5L3qt58TIXPkOoOx7PJ7llv3oBmCX94nakpHZyFB12sGQzVvzSqmKdE
         Camw==
X-Gm-Message-State: AO0yUKWPFqgM0enKa4NRGzsPPp3KiB/MBSbVW7HMQCd/HK28OFwVbz7m
	FATy2TFYHNBicjyzYmYG8nsi5mQRfTbLeP2RvwABbkiHPXDRGuoL9UTaPySV6NkuHtS9JheIwR4
	MokUVEltXCRRm7Y42VSMeM5RWsA==
X-Received: by 2002:a05:600c:19c8:b0:3e1:bfc:d16e with SMTP id u8-20020a05600c19c800b003e10bfcd16emr19563119wmq.39.1678360803687;
        Thu, 09 Mar 2023 03:20:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/qnVD0YYOZOg0gATaJ95G2PynE58HCE1Dk3DOhH1ATAU++l0OCrumBkXbrdoQMrJSTJfkHMQ==
X-Received: by 2002:a05:600c:19c8:b0:3e1:bfc:d16e with SMTP id u8-20020a05600c19c800b003e10bfcd16emr19563083wmq.39.1678360803370;
        Thu, 09 Mar 2023 03:20:03 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t20-20020a0560001a5400b002c54f4d0f71sm18023382wry.38.2023.03.09.03.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:20:03 -0800 (PST)
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
Subject: Re: [PATCH 04/22] drm/aspeed: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-5-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-5-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:01 +0100
Message-ID: <87sfeecgta.fsf@minerva.mail-host-address-is-not-set>
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

