Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE0F6B22C5
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:24:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRfX1NKwz3cTk
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:24:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Je2CZyGu;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e5SU6G7b;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Je2CZyGu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e5SU6G7b;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRfQ6QlLz3bhx
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:24:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Je2CZyGuW41jE5Wzc6LKq8bk/71VIENRL2Iv+q1jbxdatNNYwfggHmo+B4b5wwF9oIRJON
	1vbwsOCxv8d0YNt9dT+4/Emp8ehOGqOG+iFdxUKjFd4EnxjvsniKCPqCqkvtKkL6EYttBi
	fdiyrAl8AbFy1meOHFsrAa35yUjhH8c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=e5SU6G7bLT6rqVpuM0ywmlGUADmVQh/vuXKIHWHrbbOYs12QHjVDS7mynNo7JeSPVsTfYX
	DfRK2ZnpJ3xQyc2iTWHivjkFQhJQcbVLgTB13ShjLa8sLHK4h5z/o+Dw5Ol5wUTaObFhRd
	5ZcesgTMVhYIWCtl0NoDy+L/drOcFSY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-UXNu2fdWOoasE3xvw5EB0w-1; Thu, 09 Mar 2023 06:24:26 -0500
X-MC-Unique: UXNu2fdWOoasE3xvw5EB0w-1
Received: by mail-wm1-f70.google.com with SMTP id s18-20020a7bc392000000b003deaf780ab6so651398wmj.4
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361065;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=4eJf0K8Tjp+oY7NY56FhHf6hS/sdXitlnctO8Gc3kffy3D6r/PZ9NCpCVXsBmgMBaJ
         lD7XDc3//+e8MtGuBtdHK9rqhVsKO52+kWkANOuwVQRxDcIY+HMGzy25LqjNcPDzOSnY
         lA4AQiKZfT3C9fmxFzHGeCs8YP5IDdXkzhGVxSkoH5pHFhbQZ4VX4kNXktamtB9ehgZv
         ca2JWatdpx4xNXltiU9NDJRkdjLMcEsnIxrnkjIbs78o34y74RmPthHBjZ5P4hJcPi3H
         4QPFTRiCrby+v2rj3T+ScrMROQCIF0xPD4IigXa2/hs+afgzeT+f+WnxslnYVs0A6xGK
         Vtzg==
X-Gm-Message-State: AO0yUKVDSO6HYiHdizZ3lHlCsqwU4dW9wL5N5yhio9i7sD3DTbCdGpW5
	Y/QRC1wwlukXyCkVTb78co465HUuVUbRoZsIRT/krjAC79ctP7yzo+B86SyVyz/EiMuEpXPTOxs
	kK6Rc7xY56veWGe3QpyFlcS4LCQ==
X-Received: by 2002:a05:600c:45d3:b0:3e7:cee4:f8a with SMTP id s19-20020a05600c45d300b003e7cee40f8amr19365875wmo.29.1678361065671;
        Thu, 09 Mar 2023 03:24:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9lVCuiT3oH2S4c0dL4PFGWn3m73Ldrm4xd1nwgxerYQstdGiySSUAK65ix4kHFEogJnnnnZQ==
X-Received: by 2002:a05:600c:45d3:b0:3e7:cee4:f8a with SMTP id s19-20020a05600c45d300b003e7cee40f8amr19365828wmo.29.1678361065371;
        Thu, 09 Mar 2023 03:24:25 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r1-20020a05600c35c100b003dfe5190376sm2436712wmq.35.2023.03.09.03.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:24:25 -0800 (PST)
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
Subject: Re: [PATCH 12/22] drm/mxsfb/lcdif: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-13-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-13-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:24:24 +0100
Message-ID: <87356ecglz.fsf@minerva.mail-host-address-is-not-set>
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

