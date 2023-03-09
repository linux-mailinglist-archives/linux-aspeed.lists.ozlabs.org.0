Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC406B2263
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:14:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRRK3MhMz3cd6
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:14:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=am8CFVop;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=am8CFVop;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=am8CFVop;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=am8CFVop;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRRD0JCKz3brQ
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:14:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fOclMsW6Dcq/qmgrbzDRG9ABG8aYqQLYxxYoBc5QR74=;
	b=am8CFVop0IGik2W1AzHoZL7ZpCqiPSaMdL9ZbWB6aUvKnQr5ENr28wmyn1D5cY5GyiYvMe
	IfH738Os1iv1FewKURJLsA6xiniVfoBjQoxvO9EL2TpwP366pHn7WDIfc54YMSHmf5a+kt
	XB2kyQzyhRvVlmYRHrscaly2E77Dgio=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fOclMsW6Dcq/qmgrbzDRG9ABG8aYqQLYxxYoBc5QR74=;
	b=am8CFVop0IGik2W1AzHoZL7ZpCqiPSaMdL9ZbWB6aUvKnQr5ENr28wmyn1D5cY5GyiYvMe
	IfH738Os1iv1FewKURJLsA6xiniVfoBjQoxvO9EL2TpwP366pHn7WDIfc54YMSHmf5a+kt
	XB2kyQzyhRvVlmYRHrscaly2E77Dgio=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-noFE-GLGO_CviqM1jsOchQ-1; Thu, 09 Mar 2023 06:14:42 -0500
X-MC-Unique: noFE-GLGO_CviqM1jsOchQ-1
Received: by mail-wr1-f71.google.com with SMTP id 7-20020a5d47a7000000b002be0eb97f4fso340496wrb.8
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360481;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOclMsW6Dcq/qmgrbzDRG9ABG8aYqQLYxxYoBc5QR74=;
        b=WI1DkTA3FSmJvmHoAwVT1WWbVPhIOZp3vdpDCOykT1U6peBso0cHCm+J4iO2PuGgjq
         3V8MJH4fNEo1GxSxsEj8elGG5rp/pCBqeBre4EgdANZQNICwId24z9rZ2f9r2G+ZnT3z
         T1fjBbSI0txOwabxhSQlmgHDhdE33rs2CaACqbVgbBFjEOMzVqN+YHG5QDT1rDQ7Oarj
         2FOVAvACg+kHfjHDhq+pktTBzfJZjQrRSqiTWIixEklE0eNmF5JPiADzstCmOsXtUGQ4
         NcJqiTkMPusP5PAAj0Vkaj/2e8JyAW3EDIegP2tVXoux93hEAvepgyYgZPJ3PxRAGO8S
         Onmw==
X-Gm-Message-State: AO0yUKXZmWKZJQlU1RjPUCrjR2Fd4+idKuzheEa3NbXk4WKrJPH79QM5
	aGrLMvA2TSyvoZZkMBkNZeBt2tO4sQ+ttC60dP1OAWJPcWe4zrmW4rjVIn2U8MRuiWLB313DbAy
	Mwa1gnifZfq9faIck7I96t1+1nw==
X-Received: by 2002:a5d:52c4:0:b0:2c7:390e:163c with SMTP id r4-20020a5d52c4000000b002c7390e163cmr15389429wrv.47.1678360480883;
        Thu, 09 Mar 2023 03:14:40 -0800 (PST)
X-Google-Smtp-Source: AK7set915u9SxlnTzfz8tGdDVQASzd1E75MhTfa6AFkSAnvLaeMrUwPtQlpNR4g2GraOjyd7bJsXiA==
X-Received: by 2002:a5d:52c4:0:b0:2c7:390e:163c with SMTP id r4-20020a5d52c4000000b002c7390e163cmr15389414wrv.47.1678360480580;
        Thu, 09 Mar 2023 03:14:40 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q1-20020a1ce901000000b003eb5a531232sm2198602wmc.38.2023.03.09.03.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:14:40 -0800 (PST)
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
Subject: Re: [PATCH 01/22] drm/fbdev-dma: Implement fbdev emulation for GEM
 DMA helpers
In-Reply-To: <87o7p2p4n4.fsf@minerva.mail-host-address-is-not-set>
References: <87o7p2p4n4.fsf@minerva.mail-host-address-is-not-set>
Date: Thu, 09 Mar 2023 12:14:39 +0100
Message-ID: <871qlydvmo.fsf@minerva.mail-host-address-is-not-set>
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

Javier Martinez Canillas <javierm@redhat.com> writes:

[...]

>> +	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_dma_helper_funcs);
>> +
>> +	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_dma_client_funcs);
>> +	if (ret) {
>> +		drm_err(dev, "Failed to register client: %d\n", ret);
>> +		goto err_drm_client_init;
>> +	}
>> +
>> +	ret = drm_fbdev_dma_client_hotplug(&fb_helper->client);
>> +	if (ret)
>> +		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
>> +
>> +	drm_client_register(&fb_helper->client);
>> +
>> +	return;
>> +
>> +err_drm_client_init:
>> +	drm_fb_helper_unprepare(fb_helper);
>> +	kfree(fb_helper);
>> +}
>> +EXPORT_SYMBOL(drm_fbdev_dma_setup);
>
> And this one could also be shared AFAICT if drm_fbdev_client_hotplug()
> is used instead.
>

Scratch this one, you need the custom setup function to pass the 
drm_fbdev_dma_helper_funcs to drm_client_init(). But I think the
other comments this apply.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

