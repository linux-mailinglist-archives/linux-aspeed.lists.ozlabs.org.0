Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2D7613536
	for <lists+linux-aspeed@lfdr.de>; Mon, 31 Oct 2022 13:00:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1BYZ5GLyz3cCd
	for <lists+linux-aspeed@lfdr.de>; Mon, 31 Oct 2022 23:00:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A81TQWzR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A81TQWzR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A81TQWzR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A81TQWzR;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1BYT1dd5z3bjB
	for <linux-aspeed@lists.ozlabs.org>; Mon, 31 Oct 2022 23:00:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667217626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HRPxwW2zKPepuA8PR9mUAwCAVRj8pp1PiT5CedYG760=;
	b=A81TQWzRANSt9UBXkN6GWZECwAj2+GPLXn6gdwd5irFl8gEo3FGTWQ0tGgzwhMkxQ2lwHk
	9EJ9dIXq62KH3h5oOwgKZ83yltwQfjYnOnaHOR1ePZXUP1C+hxUKtaADOJgdSnV4tlZcO1
	vZWbNYGFj0c0lpX1hv6hD75EP2wEoSM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667217626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HRPxwW2zKPepuA8PR9mUAwCAVRj8pp1PiT5CedYG760=;
	b=A81TQWzRANSt9UBXkN6GWZECwAj2+GPLXn6gdwd5irFl8gEo3FGTWQ0tGgzwhMkxQ2lwHk
	9EJ9dIXq62KH3h5oOwgKZ83yltwQfjYnOnaHOR1ePZXUP1C+hxUKtaADOJgdSnV4tlZcO1
	vZWbNYGFj0c0lpX1hv6hD75EP2wEoSM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-lKd2K_ijONKcSygXdVbf0g-1; Mon, 31 Oct 2022 08:00:25 -0400
X-MC-Unique: lKd2K_ijONKcSygXdVbf0g-1
Received: by mail-wr1-f70.google.com with SMTP id u20-20020adfc654000000b0022cc05e9119so2969576wrg.16
        for <linux-aspeed@lists.ozlabs.org>; Mon, 31 Oct 2022 05:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRPxwW2zKPepuA8PR9mUAwCAVRj8pp1PiT5CedYG760=;
        b=KIrho8kmtRVucNb+wkuSlWP3wH1850qCkJojHg7n8sr80Wou6VyHtLDkf8jZEv+DvS
         z5Ckp6KlOhQyGX4mEdfTxW4etlS71EEKw2IMm99E5yazC4SixeGhPyj43NQURxx+HhLI
         Bm7y+3r2/YO+e67tlis+0q0ZeQrJhv70e0E2sz/37EeqccZGk8HaOfzK7Fcr/q4Y41VK
         QvR2JOPLDaAibWaGOIQ/dAlqqjy26Ov8qi3LgaDVAzj88Rz/zGKcQ/gotmka+2mctOxU
         DVWeznmrvDnat2lbdhqyt8gTcQmcMm54XCTnZLC5DFU/lWlWLbKIAz0ek6u3ASP//63J
         xviQ==
X-Gm-Message-State: ACrzQf0Kb9ZWYbXv7fqLhJYNL2+86koTfST6MxkLU2YnEvtvVylqn/fp
	cmvgFM78VIF3ynaHDLZl95nWdi763g23AFsZqPSA52aQZYQKxtjFTxsShddCMWJV+Gbue8oL1hy
	84B/0feOx887Kk/9zVq01QB3T/A==
X-Received: by 2002:a5d:560e:0:b0:236:c325:4858 with SMTP id l14-20020a5d560e000000b00236c3254858mr4606544wrv.259.1667217623893;
        Mon, 31 Oct 2022 05:00:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7SGo+SId6me5X0r4rljOgpSC8TPNcKC+21wfNb2F4dclcZs6G1cIUREq2tk/ot5/dgyLJVEQ==
X-Received: by 2002:a5d:560e:0:b0:236:c325:4858 with SMTP id l14-20020a5d560e000000b00236c3254858mr4606520wrv.259.1667217623655;
        Mon, 31 Oct 2022 05:00:23 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bi19-20020a05600c3d9300b003c6c1686b10sm5388458wmb.7.2022.10.31.05.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:00:23 -0700 (PDT)
Message-ID: <2e2e3915-a7b2-d030-2ffd-117b12deedb2@redhat.com>
Date: Mon, 31 Oct 2022 13:00:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 03/21] drm/vboxvideo: Don't set struct
 drm_driver.lastclose
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-hyperv@vger.kernel.org, linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org, spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Don't set struct drm_driver.lastclose. It's used to restore the
> fbdev console. But as vboxvideo uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See
> the call to drm_client_dev_restore() in drm_lastclose().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

