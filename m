Return-Path: <linux-aspeed+bounces-4457-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D3k3NsXlUmpbVQMAu9opvQ
	(envelope-from <linux-aspeed+bounces-4457-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Sun, 12 Jul 2026 02:54:29 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCA4743567
	for <lists+linux-aspeed@lfdr.de>; Sun, 12 Jul 2026 02:54:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Kj7a6Pu5;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4457-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4457-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gyRsg1xbKz2yYY;
	Sun, 12 Jul 2026 10:54:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783705566;
	cv=none; b=dUw3Uj6wZGtcECS5Nq1QFrIW2LtadRfvxz5U5/XzixB6wPULv+cuhYwgF6srhJEOu4Ca+1/a3Xj6cuJWM0SY6v0K74uvOhoqGIay2mVoYjQRTje+mS9ktBHiUO5QLsjN0n40AN6czxM4RrAtYxydbJLOyROqrHWGWhfa9DDrBmltbUC1R1+ZFs5ajd3eVZ9szp38tVm4/V8kfWoYERQOYjITxy/by00s7BAOYQVsYzWHEOhAngCV/ROdB3zijZB9DJq6kA8mufp8yWwone/PL31oxe2Grz7efjn9xMASJeZ2onZ2ZG06tkDCUry/rfV1G/RObzCi0F59OUNXrVws5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783705566; c=relaxed/relaxed;
	bh=KvBYP+wl2IjCxMaSVmX25pjv+NEzDq5zeL7bHnenBoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i8KUsUuEFybibCUGh4gLEqYC/SBGdxsI4TUuedcTwqJ/KVvWnbs1UfY+zMgMQnBpdP7S8OtmqItrn+D9hEQW9i/tM8FzbEbJ8V9TyT5Nut6LKTpWkKOQEluo2Jkys2rExNm5kXM1JQwiVPNY8nZu4QuC7sRFj30ezgnEf1FNhY08nwVnwxVPk3KLgkXY1tFtVNB+nZ2pFA9ISrTLK1zAIowTJpo4UI+R5E4J9Vs6R2n9GKfW9qQd12UC1TXWm/3USa2mxY9rUZDnzJPPhjBWl80ygcKeWZ5iuS3iqbzDEi2/daseIXeCUwDHrE8089ophdMmS67Fod3divo7ECi5SA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kj7a6Pu5; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gxfQ51MF0z308X
	for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Jul 2026 03:46:04 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 331316182F
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jul 2026 17:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C6E1F00ADF
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jul 2026 17:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783705562;
	bh=KvBYP+wl2IjCxMaSVmX25pjv+NEzDq5zeL7bHnenBoI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Kj7a6Pu5eehgdCmmTI+vwhf9nbZJIqM/gmnHg3wk7GzSc/sIfh4SLBJdGeaTBEiDv
	 b8rDzUGmQ/ofpb+jeVOCzO/AAJvsUlpTJmujo/sCcFYlSo5w1qI5V62txkfh20z4kl
	 8oUrAnr7A+VpIdb3rMwkdCVuO7ctSV2dTRn501mKvbH8XS7Ebz3yLokZ6BfsTxc9Bm
	 bPq4gjzedbjsGFpMYyyq3+099H0QssWs4bvFBBUd2pgnTSl5SQ1f1xtuAKGKw076b6
	 m1YLoNVUzOAFOWsUsdRS6GJyVcxI8PKE6nSaCG5S2VX3Fwb/kc2mr1aHX9vD75TnB0
	 Uq2zAgam/8dZQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b01cb18515so1014481e87.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jul 2026 10:46:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqeSrboSZqgJ6KrzJl4DN/MLSnGCBGPBdHZZxqchxhSqVC4emSgKYvnFuDU3rPkA4JdravpNoLGZPelc0U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YziVe8ii0VyIqbKQKBIdt6emrV9TDP362hasKia45yPcV0ovVjC
	KssbG+bD5ramgfEK20nxDbbDrsV8RBWBfFDxJ5SZvt4rl4+2clrVqmEdmzzc4o32oMxohjv3YAK
	y8P/NxKQ+l6ft2J00uwhkAD2r8N2cn90=
X-Received: by 2002:a05:6512:688f:10b0:5b0:12d6:4c05 with SMTP id
 2adb3069b0e04-5b02369c6e8mr17375e87.36.1783705559836; Fri, 10 Jul 2026
 10:45:59 -0700 (PDT)
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com> <20260703193855.110619-11-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260703193855.110619-11-mukesh.ojha@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 19:45:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLnUf6j8jPJogpuo4w55EHqgt7LChOQX5JY5h4n2VOf5nQ@mail.gmail.com>
X-Gm-Features: AUfX_mz2mAY-nRqzEwN08-F9a7Mq7XiQwd_nI9Ppbf1sw-soYPlPLluIapY3fR0
Message-ID: <CAD++jLnUf6j8jPJogpuo4w55EHqgt7LChOQX5JY5h4n2VOf5nQ@mail.gmail.com>
Subject: Re: [PATCH 10/42] drm: pl111: Use devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Paul Cercueil <paul@crapouillou.net>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Alexey Brodkin <abrodkin@synopsys.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Eddie James <eajames@linux.ibm.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
	Houlong Wei <houlong.wei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>, 
	Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ge Gordon <gordon.ge@bst.ai>, 
	Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, 
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-media@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com, 
	linux-tegra@vger.kernel.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	sound-open-firmware@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DATE_IN_PAST(1.00)[31];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,crapouillou.net,intel.com,sys-base.io,sholland.org,synopsys.com,ideasonboard.com,amd.com,linux.ibm.com,mediatek.com,collabora.com,nuvoton.com,nvidia.com,arndb.de,linuxfoundation.org,bst.ai,linaro.org,perex.cz,suse.com,nxp.com,pengutronix.de,linux.alibaba.com,cixtech.com,oss.qualcomm.com,bstai.top,linux.dev,vger.kernel.org,lists.freedesktop.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev,alsa-project.org];
	TAGGED_FROM(0.00)[bounces-4457-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:paul@crapouillou.net,m:anitha.chrisanthus@intel.com,m:paulk@sys-base.io,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:abrodkin@synopsys.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:michal.simek@amd.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:eajames@linux.ibm.com,m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:minghsiu.tsai@mediatek.com,m:houlong.wei@mediatek.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:kwliu@nuvoton.com,m:kflin@nuvoton.com,m:dmitry.osipenko@collabora.com,m:krzk@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia
 .com,m:srini@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:gordon.ge@bst.ai,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:mathieu.poirier@linaro.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:peter.ujfalusi@linux.intel.com,m:yung-chuan.liao@linux.intel.com,m:daniel.baluta@nxp.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:peter.chen@cixtech.com,m:fugang.duan@cixtech.com,m:ekansh.gupta@oss.qualcomm.com,m:bst-upstream@bstai.top,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:kernel@pengutronix.de,m:kai.vehmanen@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:Vijendar.Mukunda@amd.com,m:zhang.lyra@gmail.com,m:cix-kernel-upstream@cixtech.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.i
 nfradead.org,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-media@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:linux-tegra@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:sound-open-firmware@alsa-project.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[92];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:from_smtp,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECCA4743567

On Fri, Jul 3, 2026 at 9:43=E2=80=AFPM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:

> Switch to devm_of_reserved_mem_device_init() so the reserved memory
> region is released automatically on probe failure or device removal.
> Remove the explicit of_reserved_mem_device_release() calls in the
> dev_put error path and pl111_amba_remove().
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Looks good to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

