Return-Path: <linux-aspeed+bounces-4405-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q/gSDjSaS2pSWQEAu9opvQ
	(envelope-from <linux-aspeed+bounces-4405-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 06 Jul 2026 14:06:12 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A94E7103DA
	for <lists+linux-aspeed@lfdr.de>; Mon, 06 Jul 2026 14:06:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4405-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4405-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gv33h4RsKz3bby;
	Mon, 06 Jul 2026 22:06:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783326253;
	cv=none; b=VCp581zDi2T9SBMdAybNvzosrnZeCvy/V14c30whkH3OaDYhDwThGsGHzeXJECh4cHjkufuJmOCVbITkvY8NN5Llpb9sTbNHrcVhHgu73D7ZK4gnGWyFXMkvGa9Z2hHESzNjzTbf5NGuZJUUdYtkmbuoLlK40uwgGD6ahStdSZ2N/EInibtVDIq59g2nF++kRAUoQ1+awaOzgBUq9z0LfcIoNbJQa94GuoEt77OjFQqWkvX7Zsb9amrh4aYKTqyNEuZ32C4r+D3UcrH1K0KNjcy26WsatpmUqcJCviJRQIiZedziq7HvLM9dvgzjyAH0c5OJ6QV3NbvQ60i5EocVJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783326253; c=relaxed/relaxed;
	bh=PyFc6hx7btg2QrJ34MAq5ZRc19BwZ2UZKdQ3fQVYlpw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TLFHTfm4Ufs141wy1fx4J9cUmMwiKL5eyU3Wp+o7vkagRzSwCNi7uyHjPJV0JNaN5xkGaTZQkeEcMF8gWPPWUaOBvWXBmncIW48+wA1O5f6QymU71DGmLjQ7NH7UshLyB0jvS4aR45+LjreABmBbuvr8+8vF23F4+FYSP+If47gNAtyw72+SrUiFbJfbf+a4Hqr63PnXHxwQcSbgd078P1hHC4ZaQvG8AKK/dxSyeOm0/eYYAAsNqAvi/eHTKK5ZRi1HiSC4lXr1Jlh6DvlUQa541h7SpLfg2wVIlm0hIIwyeOG97i2QdWTvXhBWjZ4/eAHlr88m7VyZV7YK/iQh5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass (client-ip=91.218.175.171; helo=out-171.mta0.migadu.com; envelope-from=huang.ze@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
X-Greylist: delayed 76 seconds by postgrey-1.37 at boromir; Mon, 06 Jul 2026 18:24:12 AEST
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gty7c57Ppz3bps
	for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Jul 2026 18:24:11 +1000 (AEST)
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 16:22:24 +0800
Message-Id: <DJRCCWQOT4TA.1OPAZI88KOWLW@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <imx@lists.linux.dev>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/9] drm: replace simple display pipe users with atomic
 helpers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>, "Alexey Brodkin" <abrodkin@synopsys.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Joel Stanley" <joel@jms.id.au>, "Andrew Jeffery"
 <andrew@codeconstruct.com.au>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Linus
 Walleij" <linusw@kernel.org>, "Hans de Goede" <hansg@kernel.org>, "Alex
 Lanzano" <lanzano.alex@gmail.com>, "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <9612bb41-db52-4169-a7fa-e57268d69e24@suse.de>
In-Reply-To: <9612bb41-db52-4169-a7fa-e57268d69e24@suse.de>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.5 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,TO_EQ_FM_DIRECT_MX
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.49 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed), No valid DKIM,reject];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4405-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,oss.qualcomm.com,synopsys.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,nxp.com,pengutronix.de,epam.com];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:tzimmermann@suse.de,m:ze.huang@oss.qualcomm.com,m:abrodkin@synopsys.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linusw@kernel.org,m:hansg@kernel.org,m:lanzano.alex@gmail.com,m:oleksandr_andrushchenko@epam.com,m:lanzanoalex@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[ze.huang@oss.qualcomm.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ze.huang@oss.qualcomm.com,linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,lists.ozlabs.org:from_smtp,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A94E7103DA

On Mon Jul 6, 2026 at 3:27 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 04.07.26 um 20:31 schrieb Ze Huang:
>> struct drm_simple_display_pipe was meant to simplify simple DRM
>> drivers, but instead adds an extra wrapper around normal DRM atomic
>> helper setup. As noted in Documentation/gpu/todo.rst, remaining users
>> should be converted to regular atomic helpers and stop depending on the
>> simple-KMS interfaces.
>>
>> This series converts the following drivers:
>>
>>    - arcpgu
>>    - aspeed
>>    - imx lcdc
>>    - mcde
>>    - pl111
>>    - gm12u320
>>    - repaper
>>    - tve200
>>    - xen frontend
>>
>> Each patch replaces drm_simple_display_pipe_init() with explicit
>> primary plane, CRTC and encoder setup, and moves the old simple-pipe
>> callbacks into regular plane and CRTC helper callbacks named according
>> to local driver conventions.
>>
>> The conversions preserve helper behavior that used to be implicit in
>> drm_simple_kms_helper.c, including plane-state validation, CRTC
>> primary-plane checks, affected-plane propagation, framebuffer prepare
>> handling, and existing event/vblank flow where applicable.
>>
>> Result is less helper indirection and more explicit driver-side atomic
>> wiring, with no remaining simple-KMS dependency in these drivers.
>>
>> These changes are build-tested only. No hardware testing has been
>> performed on the affected devices.
>
> Thanks a lot for the series. That's quite a nice cleanup.=C2=A0 Did you u=
se=20
> any AI to create these patches?
>

Hi Thomas,

Yes, I did. I wrote the first two conversion patches (arcpgu and
aspeed) myself to understand the migration pattern. For the remaining
drivers, I used GPT-5.5 to help with the repetitive boilerplate
conversion.

I should have reviewed the generated code more carefully before sending
the series. The sashiko-bot feedback shows that I missed several important
details, including commit-local state handling, the implicit NULL fb /
visibility checks from simple-KMS, and vblank/pageflip event ordering.
I am now going through these issues more carefully and working out the
correct fixes before sending a v2.

Do you expect AI assistance to be mentioned in the cover letter or commit
messages in some specific form? If there is a preferred tag or wording
for this, I will use it in v2.

For issues that appear to be pre-existing but are exposed or carried over
by the migration, which is better?

1. Include them as separate prep/fix patches at the beginning of the v2
series, before the corresponding conversion patches; or
2. address those pre-existing issues in a separate follow-up series?

Thanks for your time and review. :)

> Best regards
> Thomas
>

Best regards,
Ze

