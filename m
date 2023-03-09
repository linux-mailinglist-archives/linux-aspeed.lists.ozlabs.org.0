Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B99C06B22C1
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:23:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRdm3rNLz3cNJ
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:23:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RchviBk9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RchviBk9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RchviBk9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RchviBk9;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRdg41flz3bhx
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:23:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=RchviBk9BaJnOhNnVKFVpd9CCx1Z6McWsVQIkpIYmuFjfpkK5H00q/ga26aFn9WpZQYxid
	zU8U+U6Im0rFb2LUOL1fzaeuORo21Hr8v5JpWrb6i7E8VcLIRUHgmSIZveT3+XATXxSNRi
	KN/2RTAIrzWjat81XrcVJAWOk0UK6sQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=RchviBk9BaJnOhNnVKFVpd9CCx1Z6McWsVQIkpIYmuFjfpkK5H00q/ga26aFn9WpZQYxid
	zU8U+U6Im0rFb2LUOL1fzaeuORo21Hr8v5JpWrb6i7E8VcLIRUHgmSIZveT3+XATXxSNRi
	KN/2RTAIrzWjat81XrcVJAWOk0UK6sQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-Tj4xbq4POV2egMfjIRQhhw-1; Thu, 09 Mar 2023 06:23:47 -0500
X-MC-Unique: Tj4xbq4POV2egMfjIRQhhw-1
Received: by mail-wm1-f71.google.com with SMTP id o27-20020a05600c511b00b003ebf87958f8so653985wms.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361026;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=aYt6DwCWUPxK4a8Soz3jSKMog46maNBT0lq34VyhgBHLMkKQquj9PlRcrkNbEPZyca
         nDpXmGJ5CpKMEm1Sf8OmFVWwYi3AuZrcVecpJPfOTVBzahjBAVcxpuGfvyF4Ca8X1qZT
         YnBEQSuQS3dMjvJHmnL68YKkr+QV81RCimup+ZVikcf+3gYN8P0X4rKKdCZ7/b19utCw
         mCjt0jwQJinnfMaT0vDLf5nyJAzY2C2NVZdbivI4C4N/K35TXwrhDpjdHjl3bFKjLV8X
         iuQrsOqViCClOJqL/JI7VNr7h2Igxofmr1KL//dkVf4lK/3kB34UJI0FYxF0kzkHFv6t
         myqA==
X-Gm-Message-State: AO0yUKU17oIn05tDEfLu+UEYeubLaOSCSdeJaOTqaplX3hkC557XveGV
	7UlaSuaDOgXUF+0jwd5C0cOM/epON8WHPJQYKTvOAecYpMXlJgUkmP9n2xsLU9S8g/VQKjXE3zj
	+SjnDY03q38bOUAAIKWGrPuSh3w==
X-Received: by 2002:a5d:6789:0:b0:2c8:dc70:ab13 with SMTP id v9-20020a5d6789000000b002c8dc70ab13mr14211752wru.18.1678361026297;
        Thu, 09 Mar 2023 03:23:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/SH5LP3JdoN3TXJ/TYCOAs9QXCd0H2gq8nSZeQO9vW4n5twpVp9hXlg9qp/3ZX39KGtC3WSg==
X-Received: by 2002:a5d:6789:0:b0:2c8:dc70:ab13 with SMTP id v9-20020a5d6789000000b002c8dc70ab13mr14211721wru.18.1678361026031;
        Thu, 09 Mar 2023 03:23:46 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id d18-20020a5d6452000000b002c71dd1109fsm17321700wrw.47.2023.03.09.03.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:23:45 -0800 (PST)
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
Subject: Re: [PATCH 10/22] drm/logicvc: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-11-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-11-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:23:45 +0100
Message-ID: <875ybacgn2.fsf@minerva.mail-host-address-is-not-set>
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

