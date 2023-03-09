Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD696B229B
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:20:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRYz2LVXz3cMh
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:20:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d1j71K7w;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F3cWHU73;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d1j71K7w;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F3cWHU73;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRYp1hXSz3bhx
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=d1j71K7wfOiFcBlHogpxmlMQtkDBn+laXr/H/G+Ik19Du//9HJVuQLYxE4T0XyLQsdunRK
	p4XNZea43wFcmre2CnFmBK+PD9tJ4RAhAPv1vrYHRxd5Gtut38IuNETv6I3qmXUKwpgB+s
	zKB1OrHYCWHnW7my++RYp3Y6W6OTaw0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=F3cWHU73RfCvy2SUJggXvXJ6KAZcC0ahNhF63o1gBFdBb2LkRHo4vYmKUS2hNNfrHZ/7md
	oCAuZcS46pgIuWOzMmE8TWLzPjb5jXDCI8FlmZYadm63tiE62TzhR1/xHXQ1we47DqnEZq
	Eu//n0M6OOtstGdZCuYGwPu4YXh3cnA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-0qYq1YEEN0WK0RW0bH9G6A-1; Thu, 09 Mar 2023 06:20:26 -0500
X-MC-Unique: 0qYq1YEEN0WK0RW0bH9G6A-1
Received: by mail-wr1-f70.google.com with SMTP id t19-20020a0560001a5300b002ce013276b8so348651wry.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360825;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=LcMML4lDKFhxfPefEq5XVclklIzLte/cO+MxezZAh5UCPKowgU5Uol+mAoqGIdGGqo
         8Va7X6Nt5tIOkSyF2pP9lupbJ8A6j3+BLIx0anDBLwNNG/NQs7byCngc6CuXnuy2E2Q4
         9qhrnPju38RDG/CzKZSXOSJNB4BavEG1x7KiVyhqacI5r+ssHKjPyydaqtrd0byRAH0Q
         SVYzfzzYTRi2CxoQQrVkhfAxRkqrTNRbCaVSvnKUrI67pr/bQXw4ww1cdQM9CX+w6KHR
         H4y4ST5Sq2vNG6nf6PCN/oQvirS0eyyXS/iIAktCIWAbC/7GoUsq2tPdDRnCR0HOq7R2
         ZxKw==
X-Gm-Message-State: AO0yUKXm0xqjoDo8xvfoiwJHC9t7Q1oGicTL9tm3YeEPWUZ81jNvB6bv
	CcMT3VCdpGWMMs81SuFM6aCvxqz8xEm324CCYJfq5ZZn7YzPH6HX2bV74KfaAA7C5sr20ZYEZev
	G1TjShW4YSAzG5/PQxkuQZLCczg==
X-Received: by 2002:adf:e711:0:b0:2c7:40f6:d7fe with SMTP id c17-20020adfe711000000b002c740f6d7femr14224812wrm.64.1678360825568;
        Thu, 09 Mar 2023 03:20:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9k96PNTBUz0TEByIG7gapEmsch0cL8AOD17b63GFBK4F6QUKC1zqFtEdtv5cA4DKM8r6l/1w==
X-Received: by 2002:adf:e711:0:b0:2c7:40f6:d7fe with SMTP id c17-20020adfe711000000b002c740f6d7femr14224778wrm.64.1678360825289;
        Thu, 09 Mar 2023 03:20:25 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id w12-20020a5d608c000000b002c552c6c8c2sm17742706wrt.87.2023.03.09.03.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:20:25 -0800 (PST)
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
Subject: Re: [PATCH 05/22] drm/atmel-hlcdc: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-6-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-6-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:24 +0100
Message-ID: <87pm9icgsn.fsf@minerva.mail-host-address-is-not-set>
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

