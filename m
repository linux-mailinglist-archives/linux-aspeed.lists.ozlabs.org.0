Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 066106B22EC
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:27:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRjl6TX2z3cQl
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:27:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KR+NcSqv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KR+NcSqv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KR+NcSqv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KR+NcSqv;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRjf2pYTz3bhx
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:27:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=KR+NcSqvpjmczmpKRN4rzxvyJADszCv0cZNgj77z0CD7rKrpgQ/77BW9VjHIdK5Vgqv12U
	CwGDeS77II4Y1siRn1zTBxTWuBRJ8edKK/QxK9mWritKZIJ7mY7Gx3l8A1F77GlWT6k5hm
	sPogGnCUxXqGCvFWnjCT6Tu/4oyKymI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=KR+NcSqvpjmczmpKRN4rzxvyJADszCv0cZNgj77z0CD7rKrpgQ/77BW9VjHIdK5Vgqv12U
	CwGDeS77II4Y1siRn1zTBxTWuBRJ8edKK/QxK9mWritKZIJ7mY7Gx3l8A1F77GlWT6k5hm
	sPogGnCUxXqGCvFWnjCT6Tu/4oyKymI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-U8uMiLWcNyuSQDRyEETY-w-1; Thu, 09 Mar 2023 06:27:15 -0500
X-MC-Unique: U8uMiLWcNyuSQDRyEETY-w-1
Received: by mail-wm1-f70.google.com with SMTP id l23-20020a7bc457000000b003e206cbce8dso543678wmi.7
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361234;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=NCfv+zyyUTh83iLW7WPotQLlSF2GvnvfUlbQ8/wG2icQ41+oJsmzmJzdRFC0H0q8S3
         K+e1XHN7Oou3rcJh5sVgBPWQy5CWfD5JsdPYctlGv6xZN/UaZaG4IPJPQxazrMa1OQ1U
         dCKfLmz48Q1cpPT4fBOGncL2GkaarlQJuTr7eOU7V4sakWGrdf6Y/KSCDj3iLnB1Bf5t
         Vkkq3aqVEbMoXczLFnohjYrEnBmePFxqXQLj4WKgTWgp+Kdbc6MGgBXW9XBVefIGtELW
         PW9VbCcOlDPZkBrKNLzr6dAxYSIHcmYWy5rM3KS+l/BhYN8rEDzV7KilFKL/CemisXCS
         iLcQ==
X-Gm-Message-State: AO0yUKVqmScl73YyIT5EX86YaCuSUacXrm2+HLcjXR4TmQ4tQkY7H6pL
	hrHy+IwF3V9vfuxAZ6KS9XCLsqxMwuqu5QyfxMxNxNENWQssvqj5HuJgsjr2OfHvML1rnwvvaKB
	KMKTPbx7/0inEtcT0P07p1MferA==
X-Received: by 2002:adf:eec2:0:b0:2c5:8d06:75c2 with SMTP id a2-20020adfeec2000000b002c58d0675c2mr16142989wrp.35.1678361233891;
        Thu, 09 Mar 2023 03:27:13 -0800 (PST)
X-Google-Smtp-Source: AK7set8ARdxfkcrK23hiLLxHMM+1xly+a483wuNbL82OhsV1hVbBQRT5MxfXfizo4EESj/6UVgIYTA==
X-Received: by 2002:adf:eec2:0:b0:2c5:8d06:75c2 with SMTP id a2-20020adfeec2000000b002c58d0675c2mr16142965wrp.35.1678361233574;
        Thu, 09 Mar 2023 03:27:13 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z16-20020adfdf90000000b002c707785da4sm17592422wrl.107.2023.03.09.03.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:27:13 -0800 (PST)
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
Subject: Re: [PATCH 17/22] drm/tidss: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-18-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-18-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:27:12 +0100
Message-ID: <87jzzq6u7j.fsf@minerva.mail-host-address-is-not-set>
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

