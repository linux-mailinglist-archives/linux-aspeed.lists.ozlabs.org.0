Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A106B22B5
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:22:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRbv23C5z3cMf
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:22:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CcQrOEUB;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CcQrOEUB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CcQrOEUB;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CcQrOEUB;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRbm2Qvpz3bhx
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:22:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=CcQrOEUB/gHc08FDyHUmbpoI5j6Sxt29lT4DqNfsktbvGB4CYoWTU6NGm5Y+cZuTV9ju5+
	cuoSB8NLuNzi6jh0++rfYbwfGO22kfiwryBDWxs5z7KGzUdVBRyiQ/yb1ydC79sIVR0LGA
	lHgfXd605kMnf4kMXIp0mvlLzqhE+xs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=CcQrOEUB/gHc08FDyHUmbpoI5j6Sxt29lT4DqNfsktbvGB4CYoWTU6NGm5Y+cZuTV9ju5+
	cuoSB8NLuNzi6jh0++rfYbwfGO22kfiwryBDWxs5z7KGzUdVBRyiQ/yb1ydC79sIVR0LGA
	lHgfXd605kMnf4kMXIp0mvlLzqhE+xs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-14dLJtl3O9qTW6--gpGwqw-1; Thu, 09 Mar 2023 06:22:08 -0500
X-MC-Unique: 14dLJtl3O9qTW6--gpGwqw-1
Received: by mail-wm1-f70.google.com with SMTP id m31-20020a05600c3b1f00b003e9de8c95easo542171wms.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360927;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=d5lhMgKR19xfBuZh9i4GGr94sHXXG/H1fD4qLYknJ1rPLBG1vwS++KET4lMwWM5Chw
         RvgeSnmuf/iO034S78saJQqh9PQjkLlbE3RmmjTcry5SotrGblf/S1pjx+NIXQ2n11Xi
         J+RwwAtjcq3pjEtEIFVu8Cu30czk4MtiBN7P/1uZpsf0wtHJtu74tw7JouJ8/M5VvxWF
         dn0xVMy8dT5P31z4fNdleF09Glu8Kh8eJeM+dFisx0YOcFQzlZwTwteVZwIQyAg/EZop
         hoU+fnivxDlmsAXtoMlnH8k/TbAMCvy3N5/J3VSKBi1AoORfab9xA8zpl8zrOzEhQ4A7
         VL8A==
X-Gm-Message-State: AO0yUKXEWRZgrdEWNynZGMhkipnra31KMKxeskywTY07nbg1Qr4TIQtj
	ycEhNVPus/oWl9gJDBxsx34oCFmOvCpy6SNqkxAYwcJ7OZu/d4ampns//crySlXKeDuv7RElSze
	mqXWedrVXVQAoAvdaC/dqDnP0KA==
X-Received: by 2002:a05:600c:1909:b0:3eb:248f:a140 with SMTP id j9-20020a05600c190900b003eb248fa140mr20913764wmq.6.1678360927399;
        Thu, 09 Mar 2023 03:22:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8sm+8KaUtaTToC6ewzxor62agxQaZWhIHs+6czjysLnXbg5f9mG7vIV2yLxia1B+mTwIz1AA==
X-Received: by 2002:a05:600c:1909:b0:3eb:248f:a140 with SMTP id j9-20020a05600c190900b003eb248fa140mr20913724wmq.6.1678360927112;
        Thu, 09 Mar 2023 03:22:07 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id i3-20020a05600c354300b003ebff290a52sm2051380wmq.28.2023.03.09.03.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:22:06 -0800 (PST)
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
Subject: Re: [PATCH 08/22] drm/imx: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-9-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-9-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:22:06 +0100
Message-ID: <87bkl2cgpt.fsf@minerva.mail-host-address-is-not-set>
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

