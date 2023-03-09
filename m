Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7055E6B22D5
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:26:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRhb2Swmz3cMf
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:26:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RXjmkI3a;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RXjmkI3a;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RXjmkI3a;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RXjmkI3a;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRhV3rL4z3bhx
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:26:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=RXjmkI3aB8X/JVFQZdbVP5u5I4sZjxykPy/N05I1RR4GFWoWirHi3tMDwDpkpMkbeeJJdd
	dqFbYY0Ff6JhrJrv9nG+sfuiXHb03oT6f/wdBr/DPOE922L6egsDFT7uqqshQYXE6TpQTY
	6f4HDkic3RfLyPzI2JHFIaIKZI46Iro=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=RXjmkI3aB8X/JVFQZdbVP5u5I4sZjxykPy/N05I1RR4GFWoWirHi3tMDwDpkpMkbeeJJdd
	dqFbYY0Ff6JhrJrv9nG+sfuiXHb03oT6f/wdBr/DPOE922L6egsDFT7uqqshQYXE6TpQTY
	6f4HDkic3RfLyPzI2JHFIaIKZI46Iro=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-X-kT83CXNz6xjw4UDv03Kg-1; Thu, 09 Mar 2023 06:26:12 -0500
X-MC-Unique: X-kT83CXNz6xjw4UDv03Kg-1
Received: by mail-wm1-f71.google.com with SMTP id j6-20020a05600c1c0600b003eaf882cb85so648918wms.9
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361171;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=f1H5TPfsrfWEYXzH3SZCaFcEQIaDemzwlpjwwIiqlrIM8r77+9wbv1knGJvi51XM88
         2FZORV8bhK/XQvz6eiIjYI2vWzGbcpWLASZSOAdol1Jok+Z7n3cgnAizNT0JTEDwS1fi
         KHroPOkVMExlfFR0QhXdpo/pIzHwY6w4+xODk9NoMtunp8qnLCBpoG8ZMSrtZ0qs0dNj
         4Kg94x38oxvTP9OJMQ10VRZ/WaDqMqOlpNI2p1I4FS3xnqF9tLaz7pfsr7SSWVksQC4F
         7OqzMilVNJ+sl/kxLRNjM2EoQfzWCztBMh5Qzf7suZrLKHlEXFFWiPFct+rvxuE0ce1W
         XKQw==
X-Gm-Message-State: AO0yUKVI/6lawzwaSDdr9ChwYWHUm9AP/0BFPoEQb13AnFAyt0u4Xw7Q
	KjPY9QGGUDwQXmouY7L9fF/boYTgbKP0eZvZBGZd1t04ApD44GAtRp4gEvMI6VHEu4FK6tWBKA1
	p7H81vBABkOyzATElhiIIgyB40w==
X-Received: by 2002:a05:600c:310f:b0:3ea:edd7:1f24 with SMTP id g15-20020a05600c310f00b003eaedd71f24mr19249574wmo.39.1678361171524;
        Thu, 09 Mar 2023 03:26:11 -0800 (PST)
X-Google-Smtp-Source: AK7set8P+TR8QVeZTPkvZUtmOPITmpd/ysZXzZ/aUrzjfnJhfAoMKaclBZMuBRrY3afv4leM7oxMzQ==
X-Received: by 2002:a05:600c:310f:b0:3ea:edd7:1f24 with SMTP id g15-20020a05600c310f00b003eaedd71f24mr19249536wmo.39.1678361171233;
        Thu, 09 Mar 2023 03:26:11 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b003eae73f0fc1sm2297965wmb.18.2023.03.09.03.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:26:11 -0800 (PST)
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
Subject: Re: [PATCH 14/22] drm/sti: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-15-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-15-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:26:10 +0100
Message-ID: <87sfee6u99.fsf@minerva.mail-host-address-is-not-set>
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

