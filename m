Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AAA6B228A
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:18:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRWK0H8bz3cd2
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:18:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cDnHDXe9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cDnHDXe9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cDnHDXe9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cDnHDXe9;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRWC6ggLz3bhx
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:18:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=cDnHDXe96B7YvwQCb8Oqv7aGXwN/Zg1cQbXsjlc2/Vk/REwGmHpqa0nA6euRIDct19qfDH
	MOi2y72G0mKQTFs/LHD0wV6TqkXe6H3Ec/fnftGzIsWuFN+8Jq0/s0u+hc2wI7/c0vl0aK
	Ui3WQ/ydpmjqjxU5o/R6pijQS2NMnXo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=cDnHDXe96B7YvwQCb8Oqv7aGXwN/Zg1cQbXsjlc2/Vk/REwGmHpqa0nA6euRIDct19qfDH
	MOi2y72G0mKQTFs/LHD0wV6TqkXe6H3Ec/fnftGzIsWuFN+8Jq0/s0u+hc2wI7/c0vl0aK
	Ui3WQ/ydpmjqjxU5o/R6pijQS2NMnXo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-n-SHcZEBOdaXEwGAxjJ7XQ-1; Thu, 09 Mar 2023 06:18:11 -0500
X-MC-Unique: n-SHcZEBOdaXEwGAxjJ7XQ-1
Received: by mail-wr1-f72.google.com with SMTP id by11-20020a056000098b00b002ce45687cbdso351522wrb.12
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360690;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=J8dGas1dKr2ZEb5Jm4I+fFx7pAD6YpGassLNk1tvmosIsteynjBO+7ETZQd0oA7Fs8
         lKvAA+yabvx4Dl5rB3/S8faCODV7a5A0O8xX0BqV9W5SFIT8Y6v1u5hUvpZ0/sIcpZoy
         yRCg8pgrRUx6ajyxYWbLoqyXgQBU1BwU54yUvr9sq0ZDLc6hvXZaWTbKeHzto7oo2nLA
         I+Ks8lF5AUMQQlj/JrVWKVDRlZ2ELXFg3Rew4PLXDbU5+I082EA/lVUnogWOCnXtt43F
         kX0NGTKKp85i0Yf9yHD0oMNHf/QUYjnIPs7TBVm5XL/0+iToHLtX1hao7TInGhDo68G4
         YXMg==
X-Gm-Message-State: AO0yUKUTczMDd5DZEpoXNz60n1UvYaX859LaIE2W06RzTQuy+3B74vzS
	8u+KOHCdryMUX9c/zqKhE+xuj09pqHv37gUGqlayYa24eWe6/Qp9W7uRIa3POXQoKK7xthwu1r6
	5+TFbZJbr8gqqp9/Ha1kBjjNV6Q==
X-Received: by 2002:a05:600c:458b:b0:3ea:d620:570a with SMTP id r11-20020a05600c458b00b003ead620570amr19256940wmo.38.1678360690582;
        Thu, 09 Mar 2023 03:18:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8nz/b/mv461MJo6uCh18V+HWYnANd/m5ucTuXO+pUDMtWMOWVVOePuNeDpPXiYp2Mt7j7R+w==
X-Received: by 2002:a05:600c:458b:b0:3ea:d620:570a with SMTP id r11-20020a05600c458b00b003ead620570amr19256887wmo.38.1678360690262;
        Thu, 09 Mar 2023 03:18:10 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c229000b003eb2e33f327sm4775721wmf.2.2023.03.09.03.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:18:10 -0800 (PST)
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
Subject: Re: [PATCH 03/22] arm/malidp: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-4-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-4-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:18:09 +0100
Message-ID: <87v8jacgwe.fsf@minerva.mail-host-address-is-not-set>
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

