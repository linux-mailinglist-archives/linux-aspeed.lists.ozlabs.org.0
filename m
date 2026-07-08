Return-Path: <linux-aspeed+bounces-4439-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EY2SHmHbTmosVgIAu9opvQ
	(envelope-from <linux-aspeed+bounces-4439-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Jul 2026 01:21:05 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AC672B192
	for <lists+linux-aspeed@lfdr.de>; Thu, 09 Jul 2026 01:21:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XYn5xS7i;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dfS+HgT6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4439-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4439-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gwYxV2vdvz2yf9;
	Thu, 09 Jul 2026 09:21:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783519488;
	cv=none; b=C2q6kH31x/wCP83EOfkD58wA1tY0W2xnmI5uB1wX+Zs3pEpaYDFd6rpB1PXVoavObNvYWXP0puAXpUJ81b+RPROQOYZBNLg3ZuOWNRuos+AzsCuvej7BbDguS6Ko4lN4ryR6o47UCgP5E7RfeuTTz+GT6vKEbJfIxh5IgOvRmcqkBzKnVZsnO6HlxbLZC9scjnQNrTPD9PNYSjFe/iU3vbce/VqMyVk9gfzXXFGjfWvvLsxld2qAE0MexPqxxPOa6vDM64GMcz3DP79Tj3yLxyXvW5Gfg1PqdtZdds6NtSA4jawia38BDlPXVl2o0n6C0kpnCdWYI1PloUuccxskAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783519488; c=relaxed/relaxed;
	bh=7S+MjchcQqeSwjWf/6h1QHGeCWnNy62k3EwNXzSfzYE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=QQhvs4++cRBiHi+x7JPYUxzULLS6y+Y3xtvyT6XzRnbkDSJVd+6BNqiZ0K4bg6SqAyQli7Zc76IH+QyiU8UbAOahtiZU0WA9/YfmtdVSaGA7uIjhduGfdVgOn9Lwi9FApdGbpSaCoc5tr+St+ZFDXBjic8MyRbZyuqmy+mj1n3qRFIfwZRKTRCnlaJ//MPr46Gi1C96gItcavsAuj09ySdZcbhYyHrqf0gqlwVCAh4NRupaXZmSQu8MzndOxkTUZOPGHP+c3AqPJ1v3C81E7VFy/xDNckAT1WjDKJ57zd/tZzih1v6ZGISdc+/O3w+TqKVj5hC3i8wm7O8Pxxlk/1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XYn5xS7i; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dfS+HgT6; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=ze.huang@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gwKbf4XyGz2xWY
	for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Jul 2026 00:04:44 +1000 (AEST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668D7qka2677951
	for <linux-aspeed@lists.ozlabs.org>; Wed, 8 Jul 2026 14:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7S+MjchcQqeSwjWf/6h1QHGeCWnNy62k3EwNXzSfzYE=; b=XYn5xS7iC7VCcWix
	xhnhTIcvDNsc1/nvfBhoPlNbOhiej2Avy11JpIjojoQiY5W7VaF6F64qB174NOCl
	2CQumGJy+kTFU2ACISEHy1qwarBGDEfgE0UKgxgCq12USRJvImgwzKRpvwoihH4a
	E8Dc1MurOOAeC6VGsIkChHnSuAel5oo0Yf4wS7G8TILVblGK+LApBlJNmAFhJrE3
	iMNn1EO5gr+PsJHXUPL5j/Z3LK24ZSi7OEIPpG/qFsg48yuKx+nfFFww6QPfWnLo
	FZxPnOLImbYNSBpBGfMHvs2t6mdaDaMv4RClDsBsjH5NqC5WGizNkXg9m+Uo2Pue
	d726+Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9q5s8770-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Jul 2026 14:04:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cae455cf6dso13805765ad.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Jul 2026 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783519482; x=1784124282; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S+MjchcQqeSwjWf/6h1QHGeCWnNy62k3EwNXzSfzYE=;
        b=dfS+HgT69hp8JIrZdRhAUeO9S0DhhIquhJ5C8e4r13YkKNmHDYO8n68iQUnqB6RoVt
         LygV/Yg0GyDaM0PUYZN5FlkIGZgQgrHEIWlDAs1yYhJRDcr+A+7/q8RqpU8LU9mbjipd
         +PK+CsN2vfH7jzxujEsnSE8fqeQnjBUjjdnIXsu+fP26BvMc9L95SE56/BuFmXablHd4
         qTdCD+4YaH5xILWEPiCvq8qa3kYKR0HbZ1TGCSbOa2hT9n2AaN7i73yilZxjpvfnt8cs
         KQz92ZrYCi2HMBuhF0uXp+JXel+oVIDTyGDoDA+qCn+Bzdr4l0ohxXnkS0gKAhOeo7/p
         kwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519482; x=1784124282;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7S+MjchcQqeSwjWf/6h1QHGeCWnNy62k3EwNXzSfzYE=;
        b=e/ZKETUn7Rfdtlu+9PLXGblhLBx5FLMu+DOK9b12gtGjupm2WX1ibqogxbLiqtsd2Z
         MFbMHMUBJULutsCbWqMwglpTqvQhg6cw+lxG8JIaPGt9wm4gY9hZOPZGfvpcualkrHiH
         nCTzGIVq0tlDjMBycohEqUIAaWkaXWqU1J34XXKP3xOBM3LveFZia1OMMIEin7rXnBUI
         O7ZXxS8SCU/Y2ziZRjTCG6DjVderKQ603A4Fq2aGBcdof3jQRvT7fhxblU+rbsj1+INW
         lo7bi+y9NHOuDlDFCgM2YOpiuHZDAxq8miG+2JuJ0j/eB9GV3NKv8HNqnuUZ7JAYeB6c
         IXVA==
X-Forwarded-Encrypted: i=1; AHgh+RpKNB+h0uxb8Jw9oWv0CT4lUSf1xQjXi7ZyGKjfFv8+kvDopuaO/d3SKD1Xs+fNu8Vw2QcP55rQ7Ay1Beo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwWT6YwwPj3UYvBQNYC11WoS6VVUTDrlQ6tftG4q3dAWpqWbQV/
	nn9p+YnQxb5QOHa4tUK3J1Ro0Yw/33MWArtHg/tzj88W1laqMBK33fpi1hj3k+sb3ATWlUteSnR
	/VXvtTZ+MLwYybE3Dfnv6Sx/PwRYgOlqSMA42M6kHDqbiEZQlHnL2P6qlTWpPBZ6gFZh7
X-Gm-Gg: AfdE7cmT+kbw+yHkWknTEwVxPIq7Ot3B+3AA8qr0+O4mQrjKrWFcKyicFP4mVayi1va
	bNAC3hPA6aSyDIH2IRcK+iq5haBFCdtO1W6QkCpFhXeppKU6SYPBna0gCTbmsQ89f6+uS2/g5Vm
	hDnAfYzyj++qpBMUhRQANXf7xI4Lufy00PslCD57RXyjF9vUqoUTnDKYBgAOiXOgCeSGJ2y0TqQ
	QTvD+g1mxaXglvDvosA0z2jnrbbWtpdlqjzUHhzwKH4utND1iSouqPM9YX5TNU+3eiI8ZKYumkw
	7MhLxjkQI82E+0r9h6pmw/BXkI1BNWQVk13KY+ycIO+xwRVZvb6WZPVLWGB5EhBmnHYKUtR+lP1
	qIYLfAFf7bvQeQD4=
X-Received: by 2002:a17:903:110f:b0:2c9:ae0b:61e3 with SMTP id d9443c01a7336-2ccea2d7e14mr27467265ad.2.1783519481648;
        Wed, 08 Jul 2026 07:04:41 -0700 (PDT)
X-Received: by 2002:a17:903:110f:b0:2c9:ae0b:61e3 with SMTP id d9443c01a7336-2ccea2d7e14mr27466655ad.2.1783519481069;
        Wed, 08 Jul 2026 07:04:41 -0700 (PDT)
Received: from localhost ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdcbe2sm29180235ad.9.2026.07.08.07.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 07:04:40 -0700 (PDT)
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
Date: Wed, 08 Jul 2026 22:04:21 +0800
Message-Id: <DJT8VTO893BW.1DXRZNVOUL362@oss.qualcomm.com>
Subject: Re: [PATCH 4/9] drm/mcde: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
        "Ze Huang"
 <ze.huang@oss.qualcomm.com>,
        "Alexey Brodkin" <abrodkin@synopsys.com>,
        "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
        "Maxime Ripard"
 <mripard@kernel.org>,
        "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>,
        "Joel Stanley" <joel@jms.id.au>,
        "Andrew Jeffery"
 <andrew@codeconstruct.com.au>,
        "Frank Li" <Frank.Li@nxp.com>,
        "Sascha
 Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        "Hans de Goede" <hansg@kernel.org>,
        "Alex
 Lanzano" <lanzano.alex@gmail.com>,
        "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-4-b4e1ca053623@oss.qualcomm.com> <4d1ddd5d-2635-4ee0-8481-78f3a034233b@suse.de>
In-Reply-To: <4d1ddd5d-2635-4ee0-8481-78f3a034233b@suse.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzOCBTYWx0ZWRfX6ESTp8V/jv67
 y7y/MHRamBFXCGaiMpHlCiN/jWqfwPcGCYlZBLB9kbQT5PUlcIiqk2jqwuGdMO9WpfjKc64GYfD
 U7TR3xG2Nd2pwR8lG5ZEZb8VJdy55z+xEyJaUgyPmH4SCUjzPL84Q27SWnQQkYt+/evKkjdzaA5
 0o686sMy7xLlK5vxYizracTeUayEXPgKZE1Rtk1rXkULwIq9WOOu5hQG6wLOirNOObMCdVPF5R9
 g7uiVEEgvZEpChmjySY03Ta3Bb78UJ7PObKE99fQ4StBZ+/CjbKO3Fvjw+4PNelcX8qegZ4jA6J
 CW8FcjXqQhQghLkBmKYYkap09CZ7kEs/BRfyQnz38GVcIdj54IFAVXpE3EsLxLTUTNAwQpYsLfW
 n1cPnCYzdUGYeXYvDBmiUK5tO8Md2orN4AzMCQFUAV/HlBi/PY8Mb1i8xdv55yHo1Nys3cx3XzL
 Eba3lHBY3pONJhnpLwA==
X-Proofpoint-ORIG-GUID: yCP9hv-hOwX45mn-4yI5xMCTprwDa0ju
X-Authority-Analysis: v=2.4 cv=NfTWEWD4 c=1 sm=1 tr=0 ts=6a4e58fa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=7ZHkO8slaP7M83yUoBMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzOCBTYWx0ZWRfX9jLJnlNU7OQu
 CS7XOTLGk9qJe2bE3Yh3LctjLV0IGVKvw4Qd7eK+r/PV2eLFhruUm8hur9SkTvoBVydaCHrwG61
 lsXSpnGt/uLzOFMzrZkhojXuSC2NlXM=
X-Proofpoint-GUID: yCP9hv-hOwX45mn-4yI5xMCTprwDa0ju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080138
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4439-lists,linux-aspeed=lfdr.de];
	FORGED_SENDER(0.00)[ze.huang@oss.qualcomm.com,linux-aspeed@lists.ozlabs.org];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:ze.huang@oss.qualcomm.com,m:abrodkin@synopsys.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linusw@kernel.org,m:hansg@kernel.org,m:lanzano.alex@gmail.com,m:oleksandr_andrushchenko@epam.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:lanzanoalex@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,oss.qualcomm.com,synopsys.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,nxp.com,pengutronix.de,epam.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ze.huang@oss.qualcomm.com,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,lists.ozlabs.org:from_smtp,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,bootlin.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87AC672B192

On Wed Jul 8, 2026 at 9:02 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 04.07.26 um 20:31 schrieb Ze Huang:
>> Convert MCDE to explicit plane, CRTC and encoder objects.
>>
>> Keep FIFO, event and framebuffer update sequencing intact, and install
>> GEM framebuffer prepare callback explicitly.
>>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/mcde/mcde_display.c | 162 +++++++++++++++++++++++++++-=
--------
>>   drivers/gpu/drm/mcde/mcde_drm.h     |   6 +-
>>   drivers/gpu/drm/mcde/mcde_drv.c     |   3 +-
>>   3 files changed, 129 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/=
mcde_display.c
>> index 257a6e84dd58..4d86fa5030eb 100644
>> --- a/drivers/gpu/drm/mcde/mcde_display.c
>> +++ b/drivers/gpu/drm/mcde/mcde_display.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/regulator/consumer.h>
>>   #include <linux/media-bus-format.h>
>>  =20
>> +#include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_fb_dma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> @@ -18,7 +19,6 @@
>>   #include <drm/drm_gem_dma_helper.h>
>>   #include <drm/drm_mipi_dsi.h>
>>   #include <drm/drm_print.h>
>> -#include <drm/drm_simple_kms_helper.h>
>>   #include <drm/drm_bridge.h>
>>   #include <drm/drm_vblank.h>
>>   #include <video/mipi_display.h>
>> @@ -132,7 +132,7 @@ void mcde_display_irq(struct mcde *mcde)
>>   	writel(mispp, mcde->regs + MCDE_RISPP);
>>  =20
>>   	if (vblank)
>> -		drm_crtc_handle_vblank(&mcde->pipe.crtc);
>> +		drm_crtc_handle_vblank(&mcde->crtc);
>>  =20
>>   	if (misovl)
>>   		dev_info(mcde->dev, "some stray overlay IRQ %08x\n", misovl);
>> @@ -157,13 +157,35 @@ void mcde_display_disable_irqs(struct mcde *mcde)
>>   	writel(0xFFFFFFFF, mcde->regs + MCDE_RISCHNL);
>>   }
>>  =20
>> -static int mcde_display_check(struct drm_simple_display_pipe *pipe,
>> -			      struct drm_plane_state *pstate,
>> -			      struct drm_crtc_state *cstate)
>> +static int mcde_plane_helper_atomic_check(struct drm_plane *plane,
>> +					  struct drm_atomic_commit *state)
>>   {
>> -	const struct drm_display_mode *mode =3D &cstate->mode;
>> -	struct drm_framebuffer *old_fb =3D pipe->plane.state->fb;
>> +	struct drm_plane_state *pstate =3D drm_atomic_get_new_plane_state(stat=
e, plane);
>> +	struct drm_crtc *crtc =3D pstate->crtc;
>> +	struct drm_crtc_state *cstate;
>> +	const struct drm_display_mode *mode;
>> +	struct drm_framebuffer *old_fb =3D plane->state->fb;
>>   	struct drm_framebuffer *fb =3D pstate->fb;
>> +	int ret;
>> +
>> +	if (!crtc)
>> +		return 0;
>
> Your planes' atomic_check functions should always run=20
> drm_atomic_helper_check_plane_state() first. Otherwise, the plane state=
=20
> will be incorrect.
>
> If there is no crtc, simply pass NULL for the CRTC state.=C2=A0 I'd advis=
e to=20
> duplicate the pattern at [1] from lines 487 to 498.=C2=A0 After=20
> _check_plane_state() ran, the atomic_check can do additional tests.
>
> If not looked over all the other patches for this problem, but this=20
> comment would apply to all of them.
>
> [1]=20
> https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gpu/drm/mgag200/mg=
ag200_mode.c#L487

Will follow, thanks

>
>> +
>> +	cstate =3D drm_atomic_get_new_crtc_state(state, crtc);
>> +	if (!cstate)
>> +		return 0;
>> +
>> +	ret =3D drm_atomic_helper_check_plane_state(pstate, cstate,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  false, false);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!pstate->visible)
>> +		return 0;
>> +
>> +	mode =3D &cstate->mode;
>>  =20
>>   	if (fb) {
>>   		u32 offset =3D drm_fb_dma_get_gem_addr(fb, pstate, 0);
>> @@ -1149,16 +1171,14 @@ static void mcde_setup_dsi(struct mcde *mcde, co=
nst struct drm_display_mode *mod
>>   	*dsi_formatter_frame =3D formatter_frame;
>>   }
>>  =20
>> -static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
>> -				struct drm_crtc_state *cstate,
>> -				struct drm_plane_state *plane_state)
>> +static void mcde_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					   struct drm_atomic_commit *state)
>>   {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_plane *plane =3D &pipe->plane;
>>   	struct drm_device *drm =3D crtc->dev;
>>   	struct mcde *mcde =3D to_mcde(drm);
>> +	struct drm_crtc_state *cstate =3D crtc->state;
>>   	const struct drm_display_mode *mode =3D &cstate->mode;
>> -	struct drm_framebuffer *fb =3D plane->state->fb;
>> +	struct drm_framebuffer *fb =3D mcde->plane.state->fb;
>>   	u32 format =3D fb->format->format;
>>   	int dsi_pkt_size;
>>   	int fifo_wtrmrk;
>> @@ -1298,9 +1318,9 @@ static void mcde_display_enable(struct drm_simple_=
display_pipe *pipe,
>>   	dev_info(drm->dev, "MCDE display is enabled\n");
>>   }
>>  =20
>> -static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
>> +static void mcde_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +					    struct drm_atomic_commit *state)
>>   {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>>   	struct drm_device *drm =3D crtc->dev;
>>   	struct mcde *mcde =3D to_mcde(drm);
>>   	struct drm_pending_vblank_event *event;
>> @@ -1381,17 +1401,23 @@ static void mcde_set_extsrc(struct mcde *mcde, u=
32 buffer_address)
>>   	writel(buffer_address + mcde->stride, mcde->regs + MCDE_EXTSRCXA1);
>>   }
>>  =20
>> -static void mcde_display_update(struct drm_simple_display_pipe *pipe,
>> -				struct drm_plane_state *old_pstate)
>> +static void mcde_plane_helper_atomic_update(struct drm_plane *plane,
>> +					    struct drm_atomic_commit *state)
>>   {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_device *drm =3D crtc->dev;
>> -	struct mcde *mcde =3D to_mcde(drm);
>> -	struct drm_pending_vblank_event *event =3D crtc->state->event;
>> -	struct drm_plane *plane =3D &pipe->plane;
>> +	struct drm_crtc *crtc =3D plane->state->crtc;
>> +	struct drm_device *drm;
>> +	struct mcde *mcde;
>> +	struct drm_pending_vblank_event *event;
>>   	struct drm_plane_state *pstate =3D plane->state;
>>   	struct drm_framebuffer *fb =3D pstate->fb;
>>  =20
>> +	if (!crtc)
>> +		return;
>
> The helper first does vblank handling and then handles visibility by=20
> testing "if (fb)". No need for this test.

Will drop it

>
>> +
>> +	drm =3D crtc->dev;
>> +	mcde =3D to_mcde(drm);
>> +	event =3D crtc->state->event;
>> +
>
> And this needs to handle !crtc without returning.
>
>>   	/*
>>   	 * Handle any pending event first, we need to arm the vblank
>
> And the next block handled vblanks, which is not the right place. That's=
=20
> a preexisting issue.=C2=A0 Vblank handling is better done in the crtc's=
=20
> atomic_flush.

I'll move vblank handling logic to new atomic_flush function

>
> Best regards
> Thomas
>
>>   	 * interrupt before sending any update to the display so we don't
>> @@ -1443,9 +1469,8 @@ static void mcde_display_update(struct drm_simple_=
display_pipe *pipe,
>>   	}
>>   }

Thanks,
Ze

