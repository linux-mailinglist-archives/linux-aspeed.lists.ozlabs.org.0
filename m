Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1DC6B22FE
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:28:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRlT1KDXz3cMn
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:28:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cdi00DxM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cdi00DxM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cdi00DxM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cdi00DxM;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRlN03P2z3bhx
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:28:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Cdi00DxMNqUSST3r6IEasg5WLekJbLswqUnMgIkZ26tADcJzX8ENrpfO34ifJu1X4RKAu4
	nWXnmfqHzQHA+ionsR4s9RENKuJiuiJXIshTeDxLtu+izEWTfrIKHmAfxkgkbmO/Q7Wnmv
	OQ56Az2L8hDthAK0cphFGadRVKQi3oI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Cdi00DxMNqUSST3r6IEasg5WLekJbLswqUnMgIkZ26tADcJzX8ENrpfO34ifJu1X4RKAu4
	nWXnmfqHzQHA+ionsR4s9RENKuJiuiJXIshTeDxLtu+izEWTfrIKHmAfxkgkbmO/Q7Wnmv
	OQ56Az2L8hDthAK0cphFGadRVKQi3oI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-W2TGHpZ2OsmTW-GWT-lphg-1; Thu, 09 Mar 2023 06:28:43 -0500
X-MC-Unique: W2TGHpZ2OsmTW-GWT-lphg-1
Received: by mail-wm1-f69.google.com with SMTP id z6-20020a7bc7c6000000b003e0107732f4so547118wmk.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361322;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=scumA6IIrvEDWLTDzPdrNaA6l8fdYlJmUpxUPs7LKuwu7/YIlvMDWwLQISn3KoDsse
         fEQx0Q5ejxA1AN5j82HjlPq3l6x3Dzc9A2tX+SioFltyda0oZ5Oy21yMcx9eFc+4zL14
         x8vouHPr9PEEUlX2OO7dzye+xD1IPyZ+IdqQkhoES5QtUgoFuMB6/FtwknUCzqvO3+Xi
         TE2nklnoHCcBAIJgUriKbyCZDy9d3beU2HH+0XlDltQhVtNB0zBlpDDTZcZKtjYKvW1w
         lD+HcXBR9pYZNOipCFI+T+amHS3gs/IL56QbGRMdZ1KWp/tPI9AhxeVmxK5WU0bIeheF
         9sQA==
X-Gm-Message-State: AO0yUKW3DJp+ZUMeiDzW2r4y4gxFaKBMsxUYa7lkeVmyirPtSaUqEPA4
	3/6/+7X2FmMkaiLSZuCDaBkFdJgeYm/Gr3RMvCEp85xbyZSwdzorFqtbWC6yNAzSxR9xxvn7p2T
	zvlUAv93Ir0nJWS+H27FVpU3lUA==
X-Received: by 2002:adf:fb51:0:b0:2ce:7219:42b8 with SMTP id c17-20020adffb51000000b002ce721942b8mr7244729wrs.32.1678361322364;
        Thu, 09 Mar 2023 03:28:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8Mn2JIY54bbfAArMm1jwHLD5d38GNHioh3xaVKkpiDjrBseSSAAHghi7SxByPhaXqMV5nmpg==
X-Received: by 2002:adf:fb51:0:b0:2ce:7219:42b8 with SMTP id c17-20020adffb51000000b002ce721942b8mr7244719wrs.32.1678361322054;
        Thu, 09 Mar 2023 03:28:42 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c22-20020a7bc856000000b003dc4a47605fsm2372395wml.8.2023.03.09.03.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:28:41 -0800 (PST)
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
Subject: Re: [PATCH 21/22] drm/vc4: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-22-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-22-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:28:41 +0100
Message-ID: <878rg66u52.fsf@minerva.mail-host-address-is-not-set>
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

